<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<style>
/* 가영님 모달 style */

.write_profile {
   border-radius: 100px;
   width: 60px;
   height: 60px;
}
.modal-backdrop.show{
   opacity : 0;
}

.map-modal-body {
   padding-right: 0px;
   padding-left: 270px;
   margin-right: 0px;
}
/* .modal-dialog{
   overflow-y : initial !important
} */

.modal-body{
   max-height : 600px;;
   overflow: auto;
}

#att_zone {
   width: 500px;
   min-height: 150px;
   padding: 10px;
}

#att_zone:empty:before {
   content: attr(data-placeholder);
   color: #999;
   font-size: .9em;
}

#writeBox {
   width: 500px;
   margin: auto;
   margin-bottom: 20px;
}

video {
   width: 100%;
   height: 400px;
   object-fit: fill;
}

.box {
   width: 50px;
   height: 50px;
   border-radius: 70%;
   overflow: hidden;
}
.dropdown {
   float: right;
   position: relative;
   display: inline-block;
}

.dropdown-content {
   display: none;
   position: absolute;
   z-index: 1; /*다른 요소들보다 앞에 배치*/
   font-weight: 400;
   background-color: #f9f9f9;
   min-width: 200px;
}

.dropdown-content a {
   display: block;
   text-decoration: none;
   color: rgb(37, 37, 37);
   font-size: 12px;
   padding: 12px 20px;
}

.dropdown-content a:hover {
   background-color: #ececec
}

.dropdown:hover .dropdown-content {
   display: block;
}
/* 가영님 추가 */
.btn {
   display: inline;
   float: left;
}

.col-sm-5 {
   margin-left: 0px;
}

/* 지도Css */
.map_wrap, .map_wrap * {
   margin: 0;
   padding: 0;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
   color: #000;
   text-decoration: none;
}

.map_wrap {
   position: relative;
   width: 100%;
   height: 500px;
}

#menu_wrap {
    position: fixed;
    top: 180px;
    left: 470px;
    bottom: 0;
    width: 250px;
    height: 60%;
    margin: 10px 0 30px 10px;
    padding: 5px;
    overflow-y: auto;
    background: rgba(255, 255, 255, 0.7);
    z-index: 1;
    font-size: 12px;
    border-radius: 10px;
}

.bg_white {
   background: #fff;
}

#menu_wrap hr {
   display: block;
   height: 1px;
   border: 0;
   border-top: 2px solid #5F5F5F;
   margin: 3px 0;
}

#menu_wrap .option {
   text-align: center;
}

#menu_wrap .option p {
   margin: 10px 0;
}

#menu_wrap .option button {
   margin-left: 5px;
}

#placesList li {
   list-style: none;
}

#placesList .item {
   position: relative;
   border-bottom: 1px solid #888;
   overflow: hidden;
   cursor: pointer;
   min-height: 65px;
}

#placesList .item span {
   display: block;
   margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

#placesList .item .info {
   padding: 10px 0 10px 55px;
}

#placesList .info .gray {
   color: #8a8a8a;
}

#placesList .info .jibun {
   padding-left: 26px;
   background:
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
      no-repeat;
}

#placesList .info .tel {
   color: #009900;
}

#placesList .item .markerbg {
   float: left;
   position: absolute;
   width: 36px;
   height: 37px;
   margin: 10px 0 0 10px;
   background:
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
      no-repeat;
}

#placesList .item .marker_1 {
   background-position: 0 -10px;
}

#placesList .item .marker_2 {
   background-position: 0 -56px;
}

#placesList .item .marker_3 {
   background-position: 0 -102px
}

#placesList .item .marker_4 {
   background-position: 0 -148px;
}

#placesList .item .marker_5 {
   background-position: 0 -194px;
}

#placesList .item .marker_6 {
   background-position: 0 -240px;
}

#placesList .item .marker_7 {
   background-position: 0 -286px;
}

#placesList .item .marker_8 {
   background-position: 0 -332px;
}

#placesList .item .marker_9 {
   background-position: 0 -378px;
}

#placesList .item .marker_10 {
   background-position: 0 -423px;
}

#placesList .item .marker_11 {
   background-position: 0 -470px;
}

#placesList .item .marker_12 {
   background-position: 0 -516px;
}

#placesList .item .marker_13 {
   background-position: 0 -562px;
}

#placesList .item .marker_14 {
   background-position: 0 -608px;
}

#placesList .item .marker_15 {
   background-position: 0 -654px;
}

#pagination {
   margin: 10px auto;
   text-align: center;
}

#pagination a {
   display: inline-block;
   margin-right: 10px;
}

#pagination .on {
   font-weight: bold;
   cursor: default;
   color: #777;
}

element.style {
   padding-right: 0px;
   margin-right:0px;
}

.btn-inverse {
   border-color: #4f7080a6;
}

#icon {
   padding: 5px 5px;
   margin: 5px 5px;
}
.post{
   height:33px;
   font-size: 7pt;
   text-align:center;
   background-color:#fff;
   vertical-align:top;
   padding-left :10px !important;
   padding-top :5px !important;
   width:50px;
}

.sample{
   width:20%;
   height:50%;
}
.col-xl-6{
   padding-right: 0px;
}
.row {
    display: flex;
    flex-wrap: wrap;
    margin-right: 0px !important;
}
th {
    font-weight: bold;
}
.dropmenu{
   background-color: #fff !important;
}
.delete{
   font-size: 13px;
   transition: all 0.3s ease-in-out;
}
.plus-comment{
   font-size: 4pt;
   color:#4f7080a6;
}

.modal-header .close {
    padding: 1rem 1rem;
    margin-left: 0px !important;
}
.tableHeader{
   display: inline-block;
   width:100%;
}
.detailclose {
    position: relative;
}
element.style {
    width: 500px;
    height: 400px;
    position: relative;
    left: 295px;
    overflow: hidden;
    background: url(http://t1.daumcdn.net/mapjsapi/images/2x/bg_tile.png);
}
#i_att_zone {
   width: 500px;
   min-height: 150px;
   padding: 10px;
   margin-left: -20;
}
a{
   text-decoration: none;
}
#i_att_zone:empty:before {
   content: attr(data-placeholder);
   color: #999;
   font-size: .6em;
   margin-left: 20;
}
.profile {
   width: 100%;
   height: 100%;
   object-fit: cover;
}
#writeBox {
   width:500px;
   margin: auto;
   margin-bottom: 20px;
}
/* 가영 */
.video-preview{
    width: 50%;
    height: 50%;
    object-fit: fill;
    padding-left: 15px;
}

/* 나경 
.video-preview{
    width: 40%;
    height: 40%;
    object-fit: fill;
    padding-left: 15px;
}*/


.showVideo {
    width: 100%;
    height: 300px;
    object-fit: fill;
}
#location{
   color: blue;
   display: inline-block;
}
.bi-geo-alt-fill{
   font-size : 18pt;
}
</style>