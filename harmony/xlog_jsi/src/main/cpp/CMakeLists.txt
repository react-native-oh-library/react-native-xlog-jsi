cmake_minimum_required(VERSION 3.13)
set(CMAKE_VERBOSE_MAKEFILE on)

set(rnoh_xlog_jsi_generated_dir "${CMAKE_CURRENT_SOURCE_DIR}/generated")

file(GLOB_RECURSE rnoh_xlog_jsi_generated_SRC
    "${rnoh_xlog_jsi_generated_dir}/*.cpp"
)

set(rnoh_xlog_jsi_SRC ${rnoh_xlog_jsi_generated_SRC})

if(NOT rnoh_xlog_jsi_SRC)
    message(FATAL_ERROR "rnoh_xlog_jsi: no .cpp sources found under ${CMAKE_CURRENT_SOURCE_DIR}")
endif()

add_library(rnoh_xlog_jsi SHARED ${rnoh_xlog_jsi_SRC} RNXlogJSIModule.cpp)

target_include_directories(rnoh_xlog_jsi PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${rnoh_xlog_jsi_generated_dir}
)
target_link_libraries(rnoh_xlog_jsi PUBLIC rnoh)
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../.ohpm/@ohos+xlog@1.0.0/oh_modules/@ohos/xlog/libs/${OHOS_ARCH}")
    set(XLOG_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../../../.ohpm/@ohos+xlog@1.0.0/oh_modules/@ohos/xlog/libs/${OHOS_ARCH})
    message("XLOG_PATH1: ${XLOG_PATH}")
elseif(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/../../../oh_modules/@ohos/xlog/libs/${OHOS_ARCH}")
    set(XLOG_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../oh_modules/@ohos/xlog/libs/${OHOS_ARCH})
    message("XLOG_PATH2: ${XLOG_PATH}")
else()
    message("XLOG_PATH: empty")
endif()

file(REAL_PATH "${XLOG_PATH}" XLOG_PATH)

set(XLOG_SO "${XLOG_PATH}/libmarsxlog.so")

target_link_libraries(rnoh_xlog_jsi PUBLIC ${XLOG_SO})