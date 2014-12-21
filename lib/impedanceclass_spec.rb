# coding:utf-8
require './impedance_class'
require 'strscan'

data = Hash.new
File.open('./rawdata_sample.dat','r') do |f|
  buf = f.read
  ss = StringScanner.new(buf)
  until ss.eos? do
    case
      when ss.scan(/(.+?)::"(.+?)"/m)
      data[ss[1].gsub("\n", "")] = ss[2]
    else
      break
    end
  end
end
tympano_sample = [data["tympano_data_R"], data["tympano_data_L"] ]
reflex_sample = [data["reflex_data0"], data["reflex_data1"], data["reflex_data2"],\
                 data["reflex_data3"], data["reflex_data4"], data["reflex_data5"],\
                 data["reflex_data6"], data["reflex_data7"] ] 
tympano_reflex_sample = [data["tympano_data_R"], data["tympano_data_L"],\
                 data["reflex_data0"], data["reflex_data1"], data["reflex_data2"],\
                 data["reflex_data3"], data["reflex_data4"], data["reflex_data5"],\
                 data["reflex_data6"], data["reflex_data7"] ] 

describe Impedance do
  before :each do
    @tympano_bg_file = "./assets/background_tympanogram.png"
    @reflex_bg_file = "./assets/background_reflex.png"
    @tympano_output_file = "./output_t.png"
    @reflex_output_file = "./output_r.png"
    @delta = 0.0000001  # 許容される誤差(float型のために生じる誤差)

    File::delete(@tympano_output_file) if File::exists?(@tympano_output_file)
    File::delete(@reflex_output_file) if File::exists?(@reflex_output_file)
  end

  context 'tympanometryについて' do
    before do
      @tympano_data = tympano_sample
    end

    context 'tympanogramの背景画像(background_tympanogram.png)がない場合' do
      it '新しく背景画像を作ること' do
        File::delete(@tympano_bg_file) if File::exists?(@tympano_bg_file)
        i = Impedance.new(ImpedanceData.new(@tympano_data))
        expect(File::exists?(@tympano_bg_file)).to be true
      end
    end

    context 'Impedanceを正しいdataで作成した場合' do
      before do
        @i = Impedance.new(ImpedanceData.new(@tympano_data))
        @i.draw(@tympano_output_file, @reflex_output_file)
      end

      it 'ファイル出力されること' do
        expect(File::exists?(@tympano_output_file)).to be true
      end

      it 'pvt (physical volume test) の出力が正しいこと' do
        expect(@i.pvt[:rt]).to be_within(@delta).of(1.945)
        expect(@i.pvt[:lt]).to be_within(@delta).of(2.257)
      end

      it 'sc (static compliance) の出力が正しいこと' do
        expect(@i.sc[:rt]).to be_within(@delta).of(0.427)
        expect(@i.sc[:lt]).to be_within(@delta).of(0.322)
      end

      it 'peakの出力が正しいこと' do
        expect(@i.peak[:rt]).to be_within(@delta).of(-6)
        expect(@i.peak[:lt]).to be_within(@delta).of(-7)
      end

      it '出力は background_tympanogram.pngと異なったサイズであること' do
        expect(File::stat(@tympano_output_file).size).not_to eq File::stat(@tympano_bg_file).size
      end

      it 'dumpしたpngが出力と一致すること' do
        require 'digest/md5'
        @file_from_dump = './dump.png'
        File::delete(@file_from_dump) if File::exists?(@file_from_dump)
        p = ChunkyPNG::Image.from_datastream(ChunkyPNG::Datastream.from_blob(@i.dump_png[:tympanogram]))
        p.save(@file_from_dump, :fast_rgba)
        expect(Digest::MD5.hexdigest(File.open(@tympano_output_file, 'rb').read)).to eq \
          Digest::MD5.hexdigest(File.open(@file_from_dump, 'rb').read)
      end

      it '出力と検査確認用出力が一致すること' do
        require 'digest/md5'
        @file_for_confirm = './conf.png'
        File::delete(@file_for_confirm) if File::exists?(@file_for_confirm)
        @i.draw_for_confirm(@file_for_confirm)
        expect(Digest::MD5.hexdigest(File.open(@tympano_output_file, 'rb').read)).to eq \
          Digest::MD5.hexdigest(File.open(@file_for_confirm, 'rb').read)
      end
    end

    context 'Tympano & Reflex のデータを用いた場合' do
      before do
        @tympano_data = tympano_reflex_sample
        @i = Impedance.new(ImpedanceData.new(@tympano_data))
        @i.draw(@tympano_output_file, @reflex_output_file)
      end

      it 'ファイル出力されること' do
        expect(File::exists?(@tympano_output_file)).to be true
      end

      it 'sc (static compliance) の出力が正しいこと' do
        expect(@i.sc[:rt]).to be_within(@delta).of(0.427)
        expect(@i.sc[:lt]).to be_within(@delta).of(0.322)
      end

      it 'peakの出力が正しいこと' do
        expect(@i.peak[:rt]).to be_within(@delta).of(-6)
        expect(@i.peak[:lt]).to be_within(@delta).of(-7)
      end

      it '出力は background_tympanogram.pngと異なったサイズであること' do
        expect(File::stat(@tympano_output_file).size).not_to eq File::stat(@tympano_bg_file).size
      end

      it '出力と検査確認用出力が一致しないこと' do
        require 'digest/md5'
        @file_for_confirm = './conf.png'
        File::delete(@file_for_confirm) if File::exists?(@file_for_confirm)
        @i.draw_for_confirm(@file_for_confirm)
        expect(Digest::MD5.hexdigest(File.open(@tympano_output_file, 'rb').read)).not_to eq \
          Digest::MD5.hexdigest(File.open(@file_for_confirm, 'rb').read)
      end
    end
  end

  context 'reflexについて' do
    before do
      @reflex_data = reflex_sample
    end

    context 'reflexgramの背景画像(background_reflexgram.png)がない場合' do
      it '新しく背景画像を作ること' do
        File::delete(@reflex_bg_file) if File::exists?(@reflex_bg_file)
        i = Impedance.new(ImpedanceData.new(@reflex_data))
        expect(File::exists?(@reflex_bg_file)).to be true
      end
    end

    context 'Impedanceを正しいdataで作成した場合' do
      before do
        @i = Impedance.new(ImpedanceData.new(@reflex_data))
        @i.draw(@tympano_output_file, @reflex_output_file)
      end

      it 'ファイル出力されること' do
        expect(File::exists?(@reflex_output_file)).to be true
      end

      it 'reflex検査での pvt (physical volume test) の出力が正しいこと' do
        expect(@i.reflex_pvt[:rt]).to be_within(@delta).of(2.232)
        expect(@i.reflex_pvt[:lt]).to be_within(@delta).of(2.532)
      end

      it 'reflex検査での測定圧 pressure の出力が正しいこと' do
        expect(@i.reflex_pressure[:rt]).to be_within(@delta).of(2)
        expect(@i.reflex_pressure[:lt]).to be_within(@delta).of(1)
      end

      it '出力は background_reflex.pngと異なったサイズであること' do
        expect(File::stat(@reflex_output_file).size).not_to eq File::stat(@reflex_bg_file).size
      end

      it 'dumpしたpngが出力と一致すること' do
        require 'digest/md5'
        @file_from_dump = './dump.png'
        File::delete(@file_from_dump) if File::exists?(@file_from_dump)
        p = ChunkyPNG::Image.from_datastream(ChunkyPNG::Datastream.from_blob(@i.dump_png[:reflex]))
        p.save(@file_from_dump, :fast_rgba)
        expect(Digest::MD5.hexdigest(File.open(@reflex_output_file, 'rb').read)).to eq \
          Digest::MD5.hexdigest(File.open(@file_from_dump, 'rb').read)
      end

      it '出力と検査確認用出力が一致すること' do
        require 'digest/md5'
        @file_for_confirm = './conf.png'
        File::delete(@file_for_confirm) if File::exists?(@file_for_confirm)
        @i.draw_for_confirm(@file_for_confirm)
        expect(Digest::MD5.hexdigest(File.open(@reflex_output_file, 'rb').read)).to eq \
          Digest::MD5.hexdigest(File.open(@file_for_confirm, 'rb').read)
      end
    end

    context 'Tympano & Reflex のデータを用いた場合' do
      before do
        @reflex_data = tympano_reflex_sample
        @i = Impedance.new(ImpedanceData.new(@reflex_data))
        @i.draw(@tympano_output_file, @reflex_output_file)
      end

      it 'ファイル出力されること' do
        expect(File::exists?(@reflex_output_file)).to be true
      end

      it 'reflex検査での pvt (physical volume test) の出力が正しいこと' do
        expect(@i.reflex_pvt[:rt]).to be_within(@delta).of(2.232)
        expect(@i.reflex_pvt[:lt]).to be_within(@delta).of(2.532)
      end

      it '出力は background_reflex.pngと異なったサイズであること' do
        expect(File::stat(@reflex_output_file).size).not_to eq File::stat(@reflex_bg_file).size
      end

      it '出力と検査確認用出力が一致しないこと' do
        require 'digest/md5'
        @file_for_confirm = './conf.png'
        File::delete(@file_for_confirm) if File::exists?(@file_for_confirm)
        @i.draw_for_confirm(@file_for_confirm)
        expect(Digest::MD5.hexdigest(File.open(@reflex_output_file, 'rb').read)).not_to eq \
          Digest::MD5.hexdigest(File.open(@file_for_confirm, 'rb').read)
      end
    end
  end
end
