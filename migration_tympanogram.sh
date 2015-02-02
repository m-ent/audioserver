#!/bin/sh

rails g scaffold tympanogram patient:references examiner:references examdate:datetime comment:string image_location:string impedancemeter:string hospital:string rt_pvt:float rt_sc:float rt_peak:integer rt_interval:float rt_data:text rt_data_length:integer lt_pvt:float lt_sc:float lt_peak:integer lt_interval:float lt_data:text lt_data_length:integer
