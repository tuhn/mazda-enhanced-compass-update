Ubuntu 14.04

```
sudo add-apt-repository ppa:developmentseed/mapbox
sudo apt-get update
sudo apt-get install -y tilemill libmapnik nodejs
sudo apt-get install -y python-software-properties
```

- Open TileMill
- Create an empty project
- Close TileMill

```
sudo apt-get install -y postgresql postgresql-contrib
sudo -u postgres createuser -P root
sudo -u postgres createdb -O root gis
psql -h localhost -U root gis
sudo apt-get install -y postgis postgresql-9.3-postgis-2.1
sudo -u postgres psql -c "CREATE EXTENSION postgis; CREATE EXTENSION postgis_topology;" gis

sudo apt-get install osm2pgsql
wget http://download.geofabrik.de/asia/vietnam-latest.osm.pbf
osm2pgsql -c -d gis --slim -U root -W vietnam-latest.osm.pbf

git clone git@github.com:mapbox/osm-bright.git
cd osm-bright/
cp configure.py.sample configure.py
subl configure.py
```

- Update **configure.py** with appropriate values with your created project.

```
wget http://data.openstreetmapdata.com/simplified-land-polygons-complete-3857.zip
wget http://data.openstreetmapdata.com/land-polygons-split-3857.zip
```

- Extract 2 above ZIP files to 2 sub-folders in **osm-bright/shp**

```
sudo apt-get install mapnik-utils
cd osm-bright/shp/land-polygons-split-3857/
shapeindex land_polygons.shp
cd ../simplified-land-polygons-complete-3857/
shapeindex simplified_land_polygons.shp
cd ..
./make.py
```

- Open TileMill again
- Your map should appear with OSM-Bright style
- Export to MBTiles: select zoom limit 13-17

```
cd ~
git clone git@github.com:mapbox/mbutil.git
cd mbutil/
sudo python setup.py install

cd ~/Documents/MapBox/Export
mb-util hanoi.mbtiles ~/mazda/map/hanoi
```

Done!


