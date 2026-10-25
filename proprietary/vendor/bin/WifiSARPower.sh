ReceiverOn=`getprop sys.asus.sar.audio`
Wifion=`getprop wlan.driver.status`
Country=`getprop gsm.operator.iso-country`
CustomerID=`getprop ro.config.CID`

log -t WifiSARPower enter ReceiverOn=$ReceiverOn Wifion=$Wifion Country=$Country CustomerID=$CustomerID

case "$ReceiverOn" in
    "1")
        case "$Wifion" in
            "ok")
                case "$CustomerID" in
                    "VF_IT")
                        vendor_cmd_tool -f /data/data/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 2 --NUM_SPECS 0 --END_CMD
                        log -t WifiSARPower SAR_SET ENABLE 2
                    ;;
                    *)
                        case "$Country" in
                            *"tw"* | *"jp"* | *"ph"* | *"hk"* | *"sg"*)
                                vendor_cmd_tool -f /data/data/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 0 --NUM_SPECS 0 --END_CMD
                                log -t WifiSARPower SAR_SET ENABLE 0
                            ;;
                            *"ww"* | *"in"*)
                                vendor_cmd_tool -f /data/data/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 1 --NUM_SPECS 0 --END_CMD
                                log -t WifiSARPower SAR_SET ENABLE 1
                            ;;
                            *"us"* | *"na"* | *"sa"* | *"br"*)
                                vendor_cmd_tool -f /data/data/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 2 --NUM_SPECS 0 --END_CMD
                                log -t WifiSARPower SAR_SET ENABLE 2
                            ;;
                        esac
                    ;;
                esac
            ;;
        esac
    ;;
    "0")
        case "$Wifion" in
            "ok")
                vendor_cmd_tool -f /data/data/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 5 --NUM_SPECS 0 --END_CMD
                log -t WifiSARPower SAR_SET ENABLE 5
            ;;
        esac      
    ;;
esac

