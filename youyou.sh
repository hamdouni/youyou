#!/bin/sh

youtube-dl -o 'output.video' $1 && \

	mplayer -vc dummy -vo null -ao pcm:file=output.wav,fast output.video && \

	lame -h -b128 output.wav output.mp3 && \

	sox output.mp3 $2.mp3 silence 1 0.1 3% && \

	rm output.video output.wav output.mp3 
