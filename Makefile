.PHONY: build
build:
	docker build -t engine-sim:latest .

.PHONY: run
run: build
	docker run --rm -it -v/tmp/.X11-unix:/tmp/.X11-unix:ro -v/etc/passwd:/etc/passwd:ro -v/var/run/user/$$UID/pulse/native:/var/run/host/pulse/native -u$$UID:$$GID -eDISPLAY=$$DISPLAY -ePULSE_SERVER=/var/run/host/pulse/native --privileged --device=/dev/dri engine-sim

.PHONY: audi-i5
audi-i5: build
	docker run --rm -it -v/tmp/.X11-unix:/tmp/.X11-unix:ro -v/etc/passwd:/etc/passwd:ro -v/var/run/user/$$UID/pulse/native:/var/run/host/pulse/native -u$$UID:$$GID -eDISPLAY=$$DISPLAY -ePULSE_SERVER=/var/run/host/pulse/native --privileged --device=/dev/dri -v$$PWD/audi-i5.mr:/app/assets/main.mr engine-sim

.PHONY: bmw-M52B28
bmw-M52B28: build
	docker run --rm -it -v/tmp/.X11-unix:/tmp/.X11-unix:ro -v/etc/passwd:/etc/passwd:ro -v/var/run/user/$$UID/pulse/native:/var/run/host/pulse/native -u$$UID:$$GID -eDISPLAY=$$DISPLAY -ePULSE_SERVER=/var/run/host/pulse/native --privileged --device=/dev/dri -v$$PWD/bmw-M52B28.mr:/app/assets/main.mr engine-sim

.PHONY: chevrolet-chev_truck_454
chevrolet-chev_truck_454: build
	docker run --rm -it -v/tmp/.X11-unix:/tmp/.X11-unix:ro -v/etc/passwd:/etc/passwd:ro -v/var/run/user/$$UID/pulse/native:/var/run/host/pulse/native -u$$UID:$$GID -eDISPLAY=$$DISPLAY -ePULSE_SERVER=/var/run/host/pulse/native --privileged --device=/dev/dri -v$$PWD/chevrolet-chev_truck_454.mr:/app/assets/main.mr engine-sim

.PHONY: chevrolet-engine_03_for_e1
chevrolet-engine_03_for_e1: build
	docker run --rm -it -v/tmp/.X11-unix:/tmp/.X11-unix:ro -v/etc/passwd:/etc/passwd:ro -v/var/run/user/$$UID/pulse/native:/var/run/host/pulse/native -u$$UID:$$GID -eDISPLAY=$$DISPLAY -ePULSE_SERVER=/var/run/host/pulse/native --privileged --device=/dev/dri -v$$PWD/chev_truck_454.mr:/app/assets/main.mr engine-sim

.PHONY: kohler-kohler_ch750
kohler-kohler_ch750: build
	docker run --rm -it -v/tmp/.X11-unix:/tmp/.X11-unix:ro -v/etc/passwd:/etc/passwd:ro -v/var/run/user/$$UID/pulse/native:/var/run/host/pulse/native -u$$UID:$$GID -eDISPLAY=$$DISPLAY -ePULSE_SERVER=/var/run/host/pulse/native --privileged --device=/dev/dri -v$$PWD/kohler-kohler_ch750.mr:/app/assets/main.mr engine-sim
