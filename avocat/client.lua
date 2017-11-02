local takeJob = {x=-406.355,y=1086.247,z=327.705}
local bossUI = {x=-422.862,y=1073.85,z=327.692}

ESX                             = nil
local PlayerData 				= nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = 'Avocat',
		number     = 'avocat',
		base64Icon = 'data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABGAAD/4QMpaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjAtYzA2MCA2MS4xMzQ3NzcsIDIwMTAvMDIvMTItMTc6MzI6MDAgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzUgV2luZG93cyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo5QTI5MkIxMEVERkYxMUU2QTUyM0I2QUY2NTU1Mjk3QiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo5QTI5MkIxMUVERkYxMUU2QTUyM0I2QUY2NTU1Mjk3QiI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjlBMjkyQjBFRURGRjExRTZBNTIzQjZBRjY1NTUyOTdCIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjlBMjkyQjBGRURGRjExRTZBNTIzQjZBRjY1NTUyOTdCIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+/+4ADkFkb2JlAGTAAAAAAf/bAIQABAMDAwMDBAMDBAYEAwQGBwUEBAUHCAYGBwYGCAoICQkJCQgKCgwMDAwMCgwMDQ0MDBERERERFBQUFBQUFBQUFAEEBQUIBwgPCgoPFA4ODhQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU/8AAEQgBDgEOAwERAAIRAQMRAf/EAaIAAAAHAQEBAQEAAAAAAAAAAAQFAwIGAQAHCAkKCwEAAgIDAQEBAQEAAAAAAAAAAQACAwQFBgcICQoLEAACAQMDAgQCBgcDBAIGAnMBAgMRBAAFIRIxQVEGE2EicYEUMpGhBxWxQiPBUtHhMxZi8CRygvElQzRTkqKyY3PCNUQnk6OzNhdUZHTD0uIIJoMJChgZhJRFRqS0VtNVKBry4/PE1OT0ZXWFlaW1xdXl9WZ2hpamtsbW5vY3R1dnd4eXp7fH1+f3OEhYaHiImKi4yNjo+Ck5SVlpeYmZqbnJ2en5KjpKWmp6ipqqusra6voRAAICAQIDBQUEBQYECAMDbQEAAhEDBCESMUEFURNhIgZxgZEyobHwFMHR4SNCFVJicvEzJDRDghaSUyWiY7LCB3PSNeJEgxdUkwgJChgZJjZFGidkdFU38qOzwygp0+PzhJSktMTU5PRldYWVpbXF1eX1RlZmdoaWprbG1ub2R1dnd4eXp7fH1+f3OEhYaHiImKi4yNjo+DlJWWl5iZmpucnZ6fkqOkpaanqKmqq6ytrq+v/aAAwDAQACEQMRAD8A9/Yq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYq7FXYqgNR1vSNJls4NTvobSfUJltbGKaRUeedzRUjUmrH5ZEyA5uTh02XMJGETIQFyoch3nuR+ScZ2KuxV2KuxV2KuxV2KuxV2KuxV2KuxV2KuxV2KuxV2KuxV2KuxV2KuxV2KuxV2KuxV2KuxV2KuxVBarq+l6FYTaprV5DYadbjlNdXMixRKPdmIGAkAWW/T6fLnmMe'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer

  
  Citizen.CreateThread(function()
  	while true do
  		Citizen.Wait(0)

  		if(PlayerData.job ~= nil and PlayerData.job.name == "avocat") then
  			DrawMarker(1,takeJob.x,takeJob.y,takeJob.z-1,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)

  			if(GetDistanceBetweenCoords(takeJob.x,takeJob.y,takeJob.z,  GetEntityCoords(GetPlayerPed(-1)), true) < 3) then 
  				Info("Appuyez sur ~g~E~w~ pour ouvrir votre casier.")
  				if(IsControlJustPressed(1, 38)) then
  					openTakeService()
  				end
  			end
  		end
  	end
  end)

  if(PlayerData.job.grade_name == "boss" and PlayerData.job.name == "avocat") then
  	createSocietyMenu(bossUI.x,bossUI.y,bossUI.z,"avocat", "Avocat")
  end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)




function Info(text, loop)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, loop, 1, 0)
end






function createSocietyMenu(x,y,z,name, menuName)
Citizen.CreateThread(function()
	local menuShowed = false
	while true do
		Citizen.Wait(0)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),x,y,z, true)
		DrawMarker(1,x,y,z-1,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
		if(distance > 3 and menuShowed) then
			ESX.UI.Menu.CloseAll()
		end

		if(distance<3) then
			if(menuShowed) then
				Info("Appuyez sur ~g~E~w~ pour ~r~fermer~w~.")
			else
				Info("Appuyez sur ~g~E~w~ pour ~g~accèder~w~ aux fonds de l'entreprise.")
			end

			if(IsControlJustPressed(1, 38)) then
				menuShowed = not menuShowed

				if(menuShowed) then
					print(name)
					renderMenu(name, menuName)
				else
					ESX.UI.Menu.CloseAll()
				end
			end
		end
	end
end)
end


function renderMenu(name, menuName)
	local _name = name
	local elements = {}
	

  	table.insert(elements, {label = 'retirer argent société', value = 'withdraw_society_money'})
  	table.insert(elements, {label = 'déposer argent',        value = 'deposit_money'})
  	table.insert(elements, {label = 'blanchir argent',        value = 'wash_money'})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'realestateagent',
		{
			title    = menuName,
			elements = elements
		},
		function(data, menu)

			if data.current.value == 'withdraw_society_money' then

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'withdraw_society_money_amount',
					{
						title = 'montant du retrait'
					},
					function(data, menu)

						local amount = tonumber(data.value)

						if amount == nil then
							ESX.ShowNotification('montant invalide')
						else
							menu.close()
							print(_name)
							TriggerServerEvent('esx_society:withdrawMoney', _name, amount)
						end

					end,
					function(data, menu)
						menu.close()
					end
				)

			end

			if data.current.value == 'deposit_money' then

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'deposit_money_amount',
					{
						title = 'montant du dépôt'
					},
					function(data, menu)

						local amount = tonumber(data.value)

						if amount == nil then
							ESX.ShowNotification('montant invalide')
						else
							menu.close()
							TriggerServerEvent('esx_society:depositMoney', _name, amount)
						end

					end,
					function(data, menu)
						menu.close()
					end
				)

			end

			if data.current.value == 'wash_money' then

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'wash_money_amount',
					{
						title = 'blanchir argent'
					},
					function(data, menu)

						local amount = tonumber(data.value)

						if amount == nil then
							ESX.ShowNotification('montant invalide')
						else
							menu.close()
							TriggerServerEvent('esx_society:washMoney', _name, amount)
						end

					end,
					function(data, menu)
						menu.close()
					end
				)

			end

		end,
		function(data, menu)

			menu.close()
		end
	)
end





function openTakeService()

  local elements = {
    {label = "Tenue citoyen", value = 'citizen_wear'},
    {label = "Tenue d'avocat", value = 'avocat_wear'}
  }

  ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'cloakroom',
      {
        title    = 'Prise de service',
        align    = 'top-left',
        elements = elements,
        },

        function(data, menu)

      menu.close()

      --Taken from SuperCoolNinja
      if data.current.value == 'citizen_wear' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local model = nil

          if skin.sex == 0 then
            model = GetHashKey("mp_m_freemode_01")
          else
            model = GetHashKey("mp_f_freemode_01")
          end

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(1)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end)
      end

      if data.current.value == 'avocat_wear' then

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

          
          if skin.sex == 0 then
            TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
          else
            TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
          end
           setComponentByGrade(skin.sex)
        end)

      end


    end,
    function(data, menu)

      menu.close()

    end
  )

end