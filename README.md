# HƯỚNG DẪN TỰ UPDATE OPENSTREETMAP CHO MAZDA ENHANCED COMPASS (Mazda 2-3 new)

**Chú ý:**
- Guide này dành cho các bạn đã cài đặt thành công bản đồ Enhanced Compass và hiện tại muốn tự cập nhật dữ liệu bản đồ mới.
- Nếu các bạn chưa cài thì làm theo guide http://mazda3.xyz/wiki/28-cai-ban-do-map-cho-mazda-3.m3vn
- Trên github của tác giả  https://github.com/flyandi/mazda-enhanced-compass-map có 1 hướng dẫn khác nhưng cá nhân thấy phức tạp, khó khăn, đọc đã thấy ngại làm.
- Hiện tại mình đã chuyển sang render bằng TileMill, xịn đẹp hơn nhưng setup phức tạp hơn nhiều so với Maperitive. Ai hứng thú mò mẫm tìm hiểu thì thử (technical) guide sau trên Ubuntu 14.04 [Guide](tilemill/tilemill.md)

Sau đây là cách render bằng Maperitive, cũng khá đơn giản.

![Demo](/shots/demo01.jpg?raw=true "Demo")

## PART 1: DOWNLOAD

1. Dữ liệu bản đồ đường đi mới nhất
     - Download: http://download.geofabrik.de/asia/vietnam-latest.osm.pbf (~26MB)
     - Lưu tại **D:\Map**.
     - Đây là dữ liệu bản đồ đường đi mới nhất từ OpenStreetMap, cập nhật khá thường xuyên, đủ dùng cho các bạn ở thành phố lớn, còn ít cập nhật đường tỉnh. Và đây chỉ là cục data thô, chưa dùng ngay được, cần phải render ra các file ảnh cho Enhanced Compass.

2. Phần mềm render
     - Download: http://maperitive.net/download/Maperitive-latest.zip (~6.4MB)
     - Giải nén ra **D:\Maperitive**

3. Bảng style cho bản đồ
     - Download: https://raw.githubusercontent.com/tuhn/mazda-enhanced-compass-update/master/mazda.mrules
     - Các style ruleset có sẵn của Maperitive không giống với bản đồ mà Enhanced Compass đang render, và chúng cũng không phù hợp để hiển thị trên màn hình ô tô. Mình đã build bộ style mới khá tương tự bộ bản đồ gốc của Enhanced Compass.
     - Mở file **D:\Maperitive\Rules\Default.mrules** bằng text editor như notepad, xoá toàn bộ nội dung đang có và thay bằng nội dung của **mazda.mrules**
     - Ngoài ra trên github repo của mình và internet có vài style rulesets khác các bạn tự khám phá ;)


## PART 2: RENDER

1. Bật **D:\Maperitive\Maperitive.exe**

2. Click vào ô **Command prompt** bên dưới gõ lần lượt các lệnh sau:
     ```
     remove-source index=1
     change-dir D:\Map
     load-source vietnam-latest.osm.pbf
     ```
3. Thực tế, chúng ta chỉ cần render và update lại 1 phần map thành phố và lân cận là đủ dùng. Không cần render lại cả Vietnam. Nên bạn zoom và di chuyển viewpoint đến thành phố của bạn.

4. Chọn menu **Map > Set Geometry Bounds**

5. Zoom Out --> bạn sẽ thấy vùng giới hạn sẽ được render màu đỏ, dùng chuột để điều chỉnh khu vực bạn muốn sẽ render và update lại.

6. Gõ lần lượt các lệnh sau vào command prompt:
     ```
     generate-tiles minzoom=13 maxzoom=13
     generate-tiles minzoom=15 maxzoom=15
     generate-tiles minzoom=17 maxzoom=17
     ```
Các file được render sẽ nằm trong **D:\Map\Tiles**. Bước này mất khoảng vài phút, máy Core-i3 8G RAM render được 50-70 tiles/sec cho zoom 17.

## PART 3: COPY TO SD CARD

1. Rút SD từ Mazda rồi cắm vào PC.
2. Copy (overwrite) các thư mục 13, 15, 17 trong **D:\Map\Tiles** vào thư mục **SD:\tiles**
3. Cắm SD trở lại Mazda. Khởi động xe và thấy bản đồ mới :)

# Script tự động render lại Hà Nội và HCM
File: **build.txt**
```
remove-source index=1
change-dir D:\Setup\Mazda\Map\Render
load-source vietnam-latest.osm.pbf
set-geo-bounds 105.67615894539442, 20.90046031560103, 106.04145435555067, 21.271729913394903
generate-tiles minzoom=13 maxzoom=13
generate-tiles minzoom=15 maxzoom=15
generate-tiles minzoom=17 maxzoom=17
set-geo-bounds 106.51335148079481, 10.620580765988256, 106.98095707161512, 11.0222076617114
generate-tiles minzoom=13 maxzoom=13
generate-tiles minzoom=15 maxzoom=15
generate-tiles minzoom=17 maxzoom=17
```
Chạy script trên từ command prompt của Maperitive:
```
run-script D:\Setup\Mazda\Map\Render\build.txt
```

# Prerendered Tiles
Mục đích chính của guide này là các bạn tự cập nhật và tuỳ biến style được. Và có thể nhiều bạn tạo ra các style và render đẹp hơn, tốt hơn mình. Còn với các bạn không tự làm được thì có thể download các Tiles do mình đã render rồi copy đè vào *SD:\tiles*, tuy nhiên các Tiles rồi sẽ lại outdate, vài tháng nữa sẽ lại phải render mới. Mình chỉ render lại khu vực trung tâm và lân cận Hà Nội, Hải Phòng, Quảng Ninh, Đà Nẵng, Hội An, HCM, Đồng Nai, Vũng Tàu.

## Rendered by TileMill (better than Maperitive)
- Mazda style: https://mega.nz/#!hYxR2RTB!Szfz1LFzvRSJA3Xajud0vT3fP2ho-m0EMFZ-s4to7Y0 (last updated: Feb 13)
