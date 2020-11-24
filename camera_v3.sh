FOLDER=$1
TOTAL_MINUTES=2.2

if [ -d "$FOLDER" ]; then
  echo "Remove folder ${FOLDER}"
  rm -R ${FOLDER}
fi

# 2: LM_IR
# 4: UM_RGB
# 6: UM_IR
# 8: UL_IR
# ./camera.sh PhamDinhKhanh_2_2 LL_IR UL_RGB UL_IR LL_RGB
mkdir ${FOLDER}
echo "My folder is $1; cam 0-1 $2; cam 2-3 $3; cam 4-5 $4; cam 6-7 $5"

start = `date +%s`

FILENAME=$2

FFREPORT=file=${FOLDER}/${FILENAME}.log:level=32 \
ffmpeg -f v4l2 -framerate 60 -video_size 1280x720 -input_format mjpeg -ss 5 -i /dev/video2 -t 125 -c:v libx264 -preset superfast -crf 18 -pix_fmt yuv420p -vb 20M -c:a libmp3lame -ac 2 -ar 44100 -b:a 128k ${FOLDER}/LL_IR.mp4 &
ffmpeg -f v4l2 -framerate 60 -video_size 1280x720 -input_format mjpeg -ss 5 -i /dev/video4 -t 125 -c:v libx264 -preset superfast -crf 18 -pix_fmt yuv420p -vb 20M -c:a libmp3lame -ac 2 -ar 44100 -b:a 128k ${FOLDER}/LL_RGB.mp4 &
ffmpeg -f v4l2 -framerate 60 -video_size 1280x720 -input_format mjpeg -ss 5 -i /dev/video6 -t 125 -c:v libx264 -preset superfast -crf 18 -pix_fmt yuv420p -vb 20M -c:a libmp3lame -ac 2 -ar 44100 -b:a 128k ${FOLDER}/UL_RGB.mp4 &
ffmpeg -f v4l2 -framerate 60 -video_size 1280x720 -input_format mjpeg -ss 5 -i /dev/video8 -t 125 -c:v libx264 -preset superfast -crf 18 -pix_fmt yuv420p -vb 20M -c:a libmp3lame -ac 2 -ar 44100 -b:a 128k ${FOLDER}/UL_IR.mp4 & 


sleep ${TOTAL_MINUTES}m

kill -2 $(pgrep ffmpeg)
