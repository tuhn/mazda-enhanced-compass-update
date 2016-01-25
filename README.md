# HƯỚNG DẪN TỰ UPDATE OPENSTREETMAP CHO MAZDA ENHANCED COMPASS (Mazda 2-3 new)

**Chú ý:**
- Guide này dành cho các bạn đã cài đặt thành công bản đồ Enhanced Compass và hiện tại muốn tự cập nhật dữ liệu bản đồ mới.
- Nếu các bạn chưa cài thì làm theo guide http://mazda3.xyz/wiki/28-cai-ban-do-map-cho-mazda-3.m3vn
- Trên github của tác giả  https://github.com/flyandi/mazda-enhanced-compass-map có 1 hướng dẫn khác nhưng cá nhân thấy phức tạp, khó khăn, đọc đã thấy ngại làm.

Sau đây là cách làm mà mình lọ mọ được, cũng khá đơn giản.

## PART 1: DOWNLOAD

1. Dữ liệu bản đồ đường đi mới nhất
Download: http://download.geofabrik.de/asia/vietnam-latest.osm.pbf (~26MB)
Lưu tại **D:\Map**
Đây là dữ liệu bản đồ đường đi mới nhất từ OpenStreetMap, cập nhật khá thường xuyên. Đây chỉ là cục data thô, chưa dùng ngay được, cần phải render ra các file ảnh cho Enhanced Compass.

2. Phần mềm render
Download: http://maperitive.net/download/Maperitive-latest.zip (~6.4MB)
Giải nén ra **D:\Maperitive**

3. Bảng style cho bản đồ
Download: https://raw.githubusercontent.com/tuhn/mazda-enhanced-compass-update/master/mazda.mrules
Các style ruleset có sẵn của Maperitive không giống với bản đồ mà Enhanced Compass đang render, và chúng cũng không phù hợp để hiển thị trên màn hình ô tô. Mình đã build bộ style mới khá tương tự bộ bản đồ gốc của Enhanced Compass.
Mở file **D:\Maperitive\Rules\Default.mrules** bằng text editor như notepad, xoá toàn bộ nội dung đang có và thay bằng nội dung của **mazda.mrules**


## PART 2: RENDER 

1. Bật **D:\Maperitive\Maperitive.exe**

2. Click vào ô **Command prompt** bên dưới gõ lần lượt các lệnh sau:
     ```
     remove-source index=1
     change-dir D:\Map
     load-source vietnam-latest.osm.pbf
     ```
3. Thực tế, chúng ta chỉ cần render và update lại 1 phần map thành phố và lân cận là đủ dùng. Không cần render lại cả Vietnam. Nên bạn zoom và di chuyển viewpoint để thành phố của bạn

4. Chọn menu **Map > Set Geometry Bounds**

5. Zoom Out --> bạn sẽ thấy vùng giới hạn sẽ được render màu đủ, dùng chuột để điều chỉnh khu vực bạn muốn sẽ render và update lại.

6. Gõ lần lượt các lệnh sau vào command prompt:
     ```
     generate-tiles minzoom=13 maxzoom=13
     generate-tiles minzoom=15 maxzoom=15
     generate-tiles minzoom=17 maxzoom=17
     ```
Các file được render sẽ nằm trong **D:\Map\Tiles**. Bước này mất khoảng vài phút, máy Core-i3 8G RAM render được 30-40 tiles/sec cho zoom 17.

## PART 3: COPY TO SD CARD

1. Rút SD từ Mazda rồi cắm vào PC.
2. Copy (overwrite) các thư mục 13, 15, 17 trong **D:\Map\Tiles** vào thư mục **SD:\tiles**
3. Cắm SD trở lại Mazda. Khởi động xe và thấy bản đồ mới :)
