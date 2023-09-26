vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO karastojko/mailio
    REF 0f7b6bd83c377505757c328d6b37b6c7ac7b1f25 # version_0-23-0
    SHA512 18ca67018cb20b53a0acfbebc887842decc2b0369ff438fd8a75cf32a1522d43612796e72ec497adc96f7c2fd3e8d11f828274575ec86a82c61c305cedadc120
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DMAILIO_BUILD_DOCUMENTATION=OFF
        -DMAILIO_BUILD_EXAMPLES=OFF
        -DMAILIO_BUILD_TESTS=OFF
        -DMAILIO_DYN_LINK_TESTS=OFF
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(
     CONFIG_PATH share/mailio/cmake
)

vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
