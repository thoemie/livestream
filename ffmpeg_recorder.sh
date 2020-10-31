#Hintergrund:
ffmpeg -nostdin -loglevel panic -i http://ap372web.estomihi.de/livestream/stream_1.m3u8 -c copy /var/www/html/recordings/$(date +%F_-%H-%M).mp4 &

#Vordergrund
#ffmpeg -nostdin -i http://ap372web.estomihi.de/livestream/stream_1.m3u8 -c copy /var/www/html/recordings/stream$(date +%FT%H:%M).mp4 

#nur aac-audio
#ffmpeg -nostdin -i http://ap371web.estomihi.de/livestream/stream_2.m3u8 -vn -acodec copy /video_recordings/stream$(date +%FT%H:%M).aac

#nur audio mp3 hintergrund
ffmpeg -nostdin -loglevel panic -i http://ap372web.estomihi.de/livestream/stream_2.m3u8 -q:a 0 -map a  /var/www/html/recordings/$(date +%F_-%H-%M).mp3 &
#ffmpeg -nostdin -loglevel panic -i http://ap372web.estomihi.de/livestream/stream_2.m3u8 -q:a 0 -map a  /var/www/html/recordings/$(date +%FT%H:%M).mp3
