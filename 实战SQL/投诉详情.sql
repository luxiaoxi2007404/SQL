要求：订单id ,司机id ,乘客电话 ,城市 ,区号 ,投诉类型 ,投诉详情1 ,投诉详情2 ,类型 ,创建时间

SELECT order_id,
       driver_id,
	   passenger_phone,
	   area,--城市
	   distinct,--区号
	   cmp_type,
	   cmp_type_txt,
	   content,
	   type,
	   a_create_time
FROM   gulfstream_ods.g_comment_complaint 
WHERE  concat_ws('-',year ,month ,day ) between '2016/12/1' and '2016/12/12'  --${START_DT}} ${END_DT}}
   AND a_status = 1
   AND type in (3,4)
   AND area in (${city_id})
   
	   

