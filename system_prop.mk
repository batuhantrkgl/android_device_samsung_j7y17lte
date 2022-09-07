# DPI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=420

# Fix for echo in calls
PRODUCT_PROPERTY_OVERRIDES += \
    audio_hal.disable_two_mic=false

# FIFO UI scheduling
PRODUCT_PROPERTY_OVERRIDES += \
    sys.use_fifo_ui=1

# Set fdsan to the warn_once severity level
PRODUCT_PROPERTY_OVERRIDES += \
    debug.fdsan=warn_once
    

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.multisim.simslotcount=1

#ifneq ($(TARGET_BUILD_VARIANT),eng)
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
#endif

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    sys.display-size=1280x720
