local RoomList
local WorldText
local FrameTime = 0
local CanExecute = true

function Initialize()
    if GAME_ID == 0xAF71841E and ENGINE_TYPE == "BACKEND" then
        InitializeRPC("1334277597416128513")
    else
        ConsolePrint("Invalid Game. This script only works with KHFM PC (Global) version.", 3)
        CanExecute = false
    end
end

function _OnInit()
    ConsolePrint("====== Kingdom Hearts FM RPC ======")
    print("")

    if ENGINE_VERSION < 5 then
        ConsolePrint("Wrong LuaEngine version. Please use at least version 5!", 3)
    end

    Initialize()
end

function _OnFrame()
    if CanExecute == true then
        FrameTime = FrameTime + 1
        if FrameTime == GetHertz() then
            local Difficulty = {"Beginner", "Standard", "Proud"}
            local Worlds = {
                "dive",
                "destiny",
                "disney",
                "traversetown",
                "wonderland",
                "deepjungle",
                "100acre",
                "",
                "agrabah",
                "atlantica",
                "halloweentown",
                "olympus",
                "monstro",
                "neverland",
                "",
                "hollowbastion",
                "endoftheworld"
            }

            local DetailText = "Lv. " .. ReadByte(0x2DE9364) .. " (" .. Difficulty[ReadByte(0x2DFF78C) + 0x01] .. ")"
            local WorldID = ReadByte(0x233FE94)
            local RoomID = ReadByte(0x233FE8C)
            if WorldID == 0x00 then
                WorldText = "Dive into the Heart"
                RoomList = {
                    "Disembark",
                    "Cinderalla Platform",
                    "Alice Platform",
                    "Awakening",
                    "Awakening",
                    "Destiny Islands",
                    "Destiny Islands"
                }
            elseif WorldID == 0x01 then
                WorldText = "Destiny Islands"
                RoomList = {
                    "Seashore",
                    "Seaside Shack",
                    "Cove",
                    "Seashore",
                    "Seaside Shack",
                    "Seashore",
                    "Seaside Shack",
                    "Secret Place",
                    "Island Remains",
                    "Sora's Room",
                    "Secret Place",
                    "Secret Place"
                }
            elseif WorldID == 0x02 then
                WorldText = "Disney Castle"
                RoomList = {
                    "Audience Chamber",
                    "Colonnade",
                    "Library",
                    "Courtyard",
                    "Spiral Stairs",
                    "Gummi Hangar",
                    "Outside Spiral Stairs Area",
                    "Path to the Crossroads",
                    "Disney Castle World"
                }
            elseif WorldID == 0x03 then
                WorldText = "Traverse Town"
                RoomList = {
                    "1st District",
                    "2nd District",
                    "3rd District",
                    "Vacant House",
                    "Alleyway",
                    "Green Room",
                    "Red Room",
                    "Hallway",
                    "Mystical House",
                    "Item Shop",
                    "Accessory Shop",
                    "Item Workshop",
                    "Geppetto's House",
                    "Dalmatians' Den",
                    "Dining Room",
                    "Living Room",
                    "Piano Room",
                    "Gizmo Shop",
                    "Merlin's House",
                    "Magician's Study",
                    "Magician's Lab",
                    "???",
                    "Secret Waterway",
                    "???",
                    "3rd District",
                    "Small House"
                }
            elseif WorldID == 0x04 then
                WorldText = "Wonderland"
                RoomList = {
                    "Rabitt Hole",
                    "Bizarre Room",
                    "Bizarre Room",
                    "Queen's Castle",
                    "Lotus Forest",
                    "Lotus Forest",
                    "Bizarre Room",
                    "Bizarre Room",
                    "Bizarre Room",
                    "Tea Party Garden"
                }
            elseif WorldID == 0x05 then
                WorldText = "Deep Jungle"
                RoomList = {
                    "Tree House",
                    "Camp",
                    "Bamboo Thicket",
                    "Jungle: Vines",
                    "Jungle: Vines 2",
                    "Hippos' Lagoon",
                    "Climbing Trees",
                    "Treetop",
                    "Jungle: Tunnel",
                    "Waterfall Cavern",
                    "Cavern of Hearts",
                    "Jungle: Cliff",
                    "Camp",
                    "Bamboo Thicket",
                    "Camp: Tent",
                    "Mini Game: Green Serpent",
                    "Mini Game: Splash Tunnel",
                    "Mini Game: Jade Spiral",
                    "Mini Game: Panic Fall",
                    "Mini Game: Shadow Cavern"
                }
            elseif WorldID == 0x06 then
                WorldText = "100 Acre Wood"
                RoomList = {
                    "Pooh's House",
                    "Pooh's Room",
                    "Rabbit's House",
                    "Rabbit's Room",
                    "Hunny Tree",
                    "Wood: Hill",
                    "Wood: Meadow",
                    "Bouncing Spot",
                    "Muddy Path",
                    "Wood: Hill",
                    "100 Acre Wood"
                }
            elseif WorldID == 0x08 then
                WorldText = "Agrabah"
                RoomList = {
                    "Desert",
                    "Desert: Cave",
                    "Agrabah: Plaza",
                    "Agrabah: Alley",
                    "Agrabah: Bazaar",
                    "Agrabah: Main Street",
                    "Palace Gates",
                    "Agrabah: Storage",
                    "Cave: Entrance",
                    "Cave: Hall",
                    "Bottomless Hall",
                    "Treasure Room",
                    "Relic Chamber",
                    "Dark Chamber",
                    "Silent Chamber",
                    "Hidden Room",
                    "Lamp Chamber",
                    "Cave: Core",
                    "Aladdin's House",
                    "Agrabah"
                }
            elseif WorldID == 0x09 then
                WorldText = "Atlantica"
                RoomList = {
                    "Atlantica",
                    "Tranquil Grotto",
                    "Calm Depths",
                    "Undersea Gorge",
                    "Undersea Cave",
                    "Undersea Garden",
                    "Sunken Ship",
                    "Below Deck",
                    "Sunken Ship",
                    "Den of Tides",
                    "Cavern Nook",
                    "Tidal Abyss",
                    "Ursula's Lair",
                    "Ariel's Grotto",
                    "Triton's Palace",
                    "Triton's Throne",
                    "Ursula Battle"
                }
            elseif WorldID == 0x0A then
                WorldText = "Halloween Town"
                RoomList = {
                    "Guillotine Square",
                    "Lab Entryway",
                    "Graveyard",
                    "Moonlight Hill",
                    "Bridge",
                    "Boneyard",
                    "Oogie's Manor",
                    "Torture Chamber",
                    "Manor Ruins",
                    "Evil Playroom",
                    "Research Lab",
                    "Guillotine Gate",
                    "Cemetary"
                }
            elseif WorldID == 0x0B then
                WorldText = "Olympus Coliseum"
                RoomList = {
                    "Coliseum Gates",
                    "Coliseum: Lobby",
                    "Coliseum: Arena",
                    "Main Gates",
                    "???",
                    "Coliseum: Arena",
                    "Coliseum: Arena"
                }
            elseif WorldID == 0x0C then
                WorldText = "Monstro"
                RoomList = {
                    "Monstro: Mouth",
                    "Monstro: Mouth",
                    "Monstro: Stomach",
                    "Monstro: Throat",
                    "Monstro: Bowels",
                    "Monstro: Chamber 1",
                    "Monstro: Chamber 2",
                    "Monstro: Chamber 3",
                    "Monstro: Chamber 4",
                    "Monstro: Chamber 5",
                    "Monstro: Chamber 6"
                }
            elseif WorldID == 0x0D then
                WorldText = "Neverland"
                RoomList = {
                    "Ship: Hold",
                    "Ship: Hold",
                    "Ship: Hold",
                    "Ship: Freezer",
                    "Ship: Galley",
                    "Ship: Cabin",
                    "Captain's Cabin",
                    "Ship: Hold",
                    "Pirate Ship",
                    "Clock Tower"
                }
            elseif WorldID == 0x0E then
                WorldText = "Hollow Bastion"
                RoomList = {
                    "Rising Falls",
                    "Castle Gates",
                    "Great Crest",
                    "High Tower",
                    "Entrance Hall",
                    "Library",
                    "Lift Stop",
                    "Base Level",
                    "Waterway",
                    "Waterway",
                    "Dungeon",
                    "Castle Chapel",
                    "Castle Chapel",
                    "Castle Chapel",
                    "Grand Hall",
                    "Dark Depths",
                    "Castle Chapel"
                }
            elseif WorldID == 0x0F then
                WorldText = "Hollow Bastion"
                RoomList = {
                    "Rising Falls",
                    "Castle Gates",
                    "Great Crest",
                    "High Tower",
                    "Entrance Hall",
                    "Library",
                    "Lift Shop",
                    "Base Level",
                    "Waterway",
                    "Waterway",
                    "Dungeon",
                    "Castle Chapel",
                    "Castle Chapel",
                    "Castle Chapel",
                    "Grand Hall",
                    "Dark Depths",
                    "Castle Chapel"
                }
            elseif WorldID == 0x10 then
                WorldText = "End of the World"
                RoomList = {
                    "Gate to the Dark",
                    "Final Dimension",
                    "Final Dimension",
                    "Final Dimension",
                    "Final Dimension",
                    "Final Dimension",
                    "Final Dimension",
                    "Final Dimension",
                    "Final Dimension",
                    "Final Dimension",
                    "Final Dimension",
                    "Final Dimension",
                    "Final Dimension",
                    "Dark Sphere",
                    "Giant Crevasse",
                    "World Terminus",
                    "World Terminus (Traverse Town)",
                    "World Terminus (Wonderland)",
                    "World Terminus (Olympus Coliseum)",
                    "World Terminus (Deep Jungle)",
                    "World Terminus (Agrabah)",
                    "World Terminus (Atlantica)",
                    "World Terminus (Halloween Town)",
                    "World Terminus (Neverland)",
                    "World Terminus (100 Acre Wood)",
                    "World Terminus (Hollow Bastion)",
                    "Evil Grounds",
                    "Volcanic Crater",
                    "Linked Worlds",
                    "Final Rest",
                    "Homecoming",
                    "Crumbling Island",
                    "Final Door",
                    "The Void",
                    "Crater",
                    "Homecoming",
                    "The Void",
                    "The Void",
                    "The Void"
                }
            elseif WorldID == 0xFF then
                WorldText = "Main Menu"
                RoomList = {"Main Menu"}
            end

            local StateText = RoomList[ReadByte(0x233FE8C) + 0x01]

            if RoomID == 0xFF then
                UpdateDetails("")
                UpdateState("Main Menu")
            else
                UpdateDetails(DetailText)
                UpdateState(StateText)
            end
            if WorldID == 0xFF then
                UpdateLImage("logo")
            else
                UpdateLImage(Worlds[WorldID + 0x01], WorldText)
            end

            FrameTime = 0
        end
    end
end
