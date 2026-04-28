
function SwitchMaps( segment )

  InvalidateReadCaches()

  if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
    
    if Tracker:ProviderCountForCode( "automapswitch" ) > 0 then
      local mapId = ReadU8( segment, 0x7e1700 )
      if mapId >= 0 then
        --print(string.format("Map ID is %#04x", mapId))

        --if mapId == 0x3b then
        if mapId == 0x00 then
          Tracker:UiHint("ActivateTab", "Overworld")
        elseif mapId == 0x01 then
        --elseif mapId == 0x35 or mapId == 0xdf then
          Tracker:UiHint("ActivateTab", "Underworld")
        elseif mapId == 0x02 then
        --elseif mapId == 0xab or mapId == 0xee then
          Tracker:UiHint("ActivateTab", "Moon")
        
        end
      end
    end
  end
end

ScriptHost:AddMemoryWatch( "Current Map ID", 0x7e1700, 1, SwitchMaps )
