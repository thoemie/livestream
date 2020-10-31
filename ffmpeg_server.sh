ffmpeg -nostdin -listen 1 -i rtmp://ap372web.estomihi.de/stream01  \
-filter_complex "[v:0]drawtext=text=\'${*}\':x=(w-text_w)-20:y=(h-3*text_h):fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf:fontsize=30:fontcolor=white,split=2[vtemp001][vout002];[vtemp001]scale=w=960:h=540[vout001]" \
-preset veryfast -g 30 -sc_threshold 0 \
-map [vout001] -c:v:0 libx264 -b:v:0 2000k -maxrate:v:0 2200k -bufsize:v:0 3000k \
-map [vout002] -c:v:1 libx264 -b:v:1 8000k -maxrate:v:1 8800k -bufsize:v:1 9000k \
-map a:0 -map a:0 -map a:0 -c:a aac -b:a 128k -ac 2  \
-f hls -hls_time 4 -hls_playlist_type event -hls_flags independent_segments   \
-master_pl_name master.m3u8   \
-hls_segment_filename stream_%v/data%06d.ts  \
-use_localtime_mkdir 1  \
-var_stream_map "v:0,a:0 v:1,a:1 a:2" stream_%v.m3u8

#ffmpgeg_$(date -F %Y-%M-%D_%H-%m)

#-filter_complex "[v:0]drawtext=text=\'${*}\':x=(w-text_w)-20:y=(h-3*text_h):fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf:fontsize=30:fontcolor=white,split=2[vtemp001][vout002];[vtemp001]scale=w=960:h=540[vout001]" \
