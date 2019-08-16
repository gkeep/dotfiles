#!/usr/bin/env bash
shopt -s checkwinsize
(:;:) # microsleep
for (( y = 0; y < LINES; y++ )); do
	for (( x = 0; x < COLUMNS; x++ )); do
		(( x2 = 0x1000 * ( (6 * x) % COLUMNS) / COLUMNS ))
		case $(( (6 * x) / COLUMNS ))  in
			0) (( r = 0xff0 )); (( g = x2 )); (( b = 0 )) ;;
			1) (( r = 0xff0 - x2 )); (( g = 0xff0 )); (( b = 0 )) ;;
			2) (( r = 0 )); (( g = 0xff0 )); (( b = x2 )) ;;
			3) (( r = 0 )); (( g = 0xff0 - x2 )); (( b = 0xff0 )) ;;
			4) (( r = x2 )); (( g = 0 )); (( b = 0xff0 )) ;;
			5) (( r = 0xff0 )); (( g = 0 )); (( b = 0xff0 - x2 )) ;;
		esac
		(( y2 = 0x1000 * ( (2 * y) % LINES) / LINES ))
		case $(( (2 * y) / LINES )) in
			0) (( r = r * y2 / 0x10000 )); (( g = g * y2 / 0x10000 )); (( b = b * y2 / 0x10000 )) ;;
			1)
				(( r = (0x1000 * ( r + y2) - y2 * r ) / 0x10000 ))
				(( g = (0x1000 * ( g + y2) - y2 * g ) / 0x10000 ))
				(( b = (0x1000 * ( b + y2) - y2 * b ) / 0x10000 ))
			;;
		esac
		printf '\e[48;2;%d;%d;%dm ' $(( r )) $(( g )) $(( b ))
	done
	printf '\n'
done

