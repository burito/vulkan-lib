
UNAME := $(shell uname -o)
ifeq ($(UNAME), Msys)
7ZIP = c:/Program\ Files/7-Zip/7z.exe
else
7ZIP = 7z
endif

download:
	mkdir -p $@

SDK_WIN = download/vulkan-sdk.exe
SDK_LIN = download/vulkan-sdk-linux.tar.gz
SDK_MAC = download/vulkan-sdk-macos.tar.gz

$(SDK_WIN): download
	curl https://sdk.lunarg.com/sdk/download/latest/windows/vulkan-sdk.exe?u= --output $@

$(SDK_MAC): download
	curl https://sdk.lunarg.com/sdk/download/latest/mac/vulkan-sdk.tar.gz?u= --output $@

$(SDK_LIN): download
	curl https://sdk.lunarg.com/sdk/download/latest/linux/vulkan-sdk.tar.gz?u= --output $@


lin: $(SDK_LIN)
	mkdir -p $@
	tar --extract --file $(SDK_LIN) --strip-components 3 --directory lin `tar tf $(SDK_LIN) | grep -E 'bin/glslangValidator|lib/libvulkan.so.[0-9].[0-9]' | grep -v 'source'`
	cd lin && ln -s `ls libvulkan.so.*` libvulkan.so && cd ..

mac: $(SDK_MAC)
	mkdir -p $@
	tar --extract --file $(SDK_MAC) --strip-components 3 --directory mac `tar tf $(SDK_MAC) | grep -E 'bin/glslangValidator|lib/libvulkan.[0-9].[0-9].[0-9]+.dylib'`
	cd mac && ln -s `ls libvulkan*` libvulkan.dylib && cd ..

win: $(SDK_WIN)
	$(7ZIP) e $(SDK_WIN) bin/glslangValidator.exe lib/vulkan-1.lib lib/vulkan-1.pdb -owin


clean:
	rm -rf mac lin win

all: lin mac win

.PHONY: clean all