; PROCEDURE:    GEN_PROB_SUB_IMAGE
;
; PURPOSE:      Modifies out_img such that it returns a region plot with probability displayed 
;
<<<<<<< HEAD
; USEAGE:       pro gen_prob_sub_image , img , out_img , label_bar_under_chart , label_bar_over_chart , label_trans_bar_chart , xy_co_ords , rr , gg , bb 
=======
; USEAGE:       pro gen_prob_sub_image , img , out_img , label_bar_under_chart , label_bar_over_chart , label_trans_bar_chart , xy_co_ords , red , green , blue 
>>>>>>> tierney/flare_prob_edits
;
; INPUT:        
;				IMG - Image array of sub-region : FLTARR
;
;               OUT_IMG - Image array to be output : FLTARR
;
;               LABEL_BAR_UNDER_CHART - Array containing the image of the bar-chart for the AR in question : FLTARR
;			
;               LABEL_BAR_OVER_CHART - Array containing the image of the bar-chart for the AR in question overplotted : FLTARR
;
;				LABEL_TRANS_BAR_CHART - Array containing the transparent portion of the AR bar-chart : FLTARR
;
;				XY_CO_ORDS - X-Y co-ordinates of the active region on the sun : FLTARR(2)
;
;				RR - Red color table : INTARR
;
;				GG - Green color table : INTARR
;
;				BB - Blue color table : INTARR
;
; OUTPUT:    
;               PNG of sub_region with transparent bar-chart displaying probability for that active region -
;                      
; EXAMPLE:      
;          		IDL>  gen_prob_sub_image , image , out_img , reform(sub_reg_black_charts[j , * , *]) , reform(sub_reg_white_charts[j , * , *]) ,$
<<<<<<< HEAD
;					  reform(sub_reg_trans_charts[j , * , *]) ,[reform(x(0 , j)) , reform(y(0 , j))] , rr, gg , bb
=======
;					  reform(sub_reg_trans_charts[j , * , *]) ,[reform(x(0 , j)) , reform(y(0 , j))] , red, green , blue
>>>>>>> tierney/flare_prob_edits
;               IDL>  write_png , file_path , out_img( * , pngcrop[0]:pngcrop[1] , pngcrop[2]:pngcrop[3] )
;         
; AUTHOR:       23-Jul-2014 Michael Tierney 
;
; EMAIL:		tiernemi@tcd.ie
;
; CONTACT:      info@solarmonitor.org
;
; VERSION       1.0
;- 
;---------------------------------------------------------------------->

<<<<<<< HEAD
pro gen_prob_sub_image , img , out_img , label_bar_under_chart , label_bar_over_chart , label_trans_bar_chart , xy_co_ords , rr , gg , bb 
=======
pro gen_prob_sub_image , img , out_img , label_bar_under_chart , label_bar_over_chart , label_trans_bar_chart , xy_co_ords , red , green , blue 
>>>>>>> tierney/flare_prob_edits
  

; Generates modified CT

  loadct , 40 , /SILENT
  tvlct , r , g , b , /GET
  r[3] = 255
  b[3] = 255
  g[3] = 255
<<<<<<< HEAD
  tvlct , r , g , b 
=======
>>>>>>> tierney/flare_prob_edits

  win_size = 0.3
  new_co_ords = convert_coord(xy_co_ords[0] , xy_co_ords[1] , /DATA , /TO_NORMAL)
  offset_x = 0.03
  offset_y = 0 

; Error handling to prevent barchart leaving plotspace

<<<<<<< HEAD
  if (new_co_ords[0] + win_size gt 0.99) then begin 
		offset_x = -0.4
  endif
  if (new_co_ords[1] + win_size gt 0.95) then begin 
		offset_y = -0.4
  endif
  if (new_co_ords[0] lt 0.1) then begin 
		offset_x = 0.4
  endif
  if (new_co_ords[1] lt 0.05) then begin 
		offset_y = 0.4
=======
  if (new_co_ords[0] + win_size gt 0.9) then begin 
		offset_x = -win_size 
  endif
  if (new_co_ords[1] + win_size gt 0.95) then begin 
		offset_y = -win_size
  endif
  if (new_co_ords[0] lt 0.1) then begin 
		offset_x = win_size
  endif
  if (new_co_ords[1] lt 0.05) then begin 
		offset_y = win_size
>>>>>>> tierney/flare_prob_edits
  endif

; Restore old ct

<<<<<<< HEAD
  tvlct , rr , gg , bb
  cgimage , img

;Use altered CT

  tvlct , r , g , b
  cgimage , label_bar_under_chart , alphafgposition=[ new_co_ords[0] + offset_x , new_co_ords[1] + offset_y $ 
  	, new_co_ords[0] + win_size + offset_x , new_co_ords[1] + win_size + offset_y] , transparent = 20. $
	, missing_value = 1
  cgimage , label_bar_over_chart , alphafgposition=[ new_co_ords[0] + offset_x , new_co_ords[1] + offset_y $ 
  	, new_co_ords[0] + win_size + offset_x , new_co_ords[1] + win_size + offset_y] , transparent = 20. $
	, missing_value = 1
  cgimage , label_trans_bar_chart , alphafgposition=[ new_co_ords[0] + offset_x , new_co_ords[1] + offset_y $
  	, new_co_ords[0] + win_size + offset_x , new_co_ords[1] + win_size + offset_y ] , $ 
=======
  tvlct , red , green , blue
  cgimage , img

; Use altered CT

  print , new_co_ords[0] + win_size + offset_x
  print , new_co_ords[1] + win_size + offset_y 
  tvlct , r , g , b
  cgimage , label_bar_under_chart , alphafgposition= [new_co_ords[0] + offset_x , new_co_ords[1] + offset_y $ 
  	, new_co_ords[0] + win_size + offset_x , new_co_ords[1] + win_size + offset_y] , transparent = 20. $
	, missing_value = 1
  cgimage , label_bar_over_chart , alphafgposition=[new_co_ords[0] + offset_x , new_co_ords[1] + offset_y $ 
  	, new_co_ords[0] + win_size + offset_x , new_co_ords[1] + win_size + offset_y] , transparent = 20. $
	, missing_value = 1
  cgimage , label_trans_bar_chart , alphafgposition=[new_co_ords[0] + offset_x , new_co_ords[1] + offset_y $
  	, new_co_ords[0] + win_size + offset_x , new_co_ords[1] + win_size + offset_y] , $ 
>>>>>>> tierney/flare_prob_edits
  	transparent = 70. , missing_value = 1 

; Turns out_img into sub-region with barchart
  
  out_img = tvrd(/true)
  
; Revert the color table to its original state
  
<<<<<<< HEAD
  tvlct , rr , gg , bb
=======
  tvlct , red , green , blue
>>>>>>> tierney/flare_prob_edits

end
