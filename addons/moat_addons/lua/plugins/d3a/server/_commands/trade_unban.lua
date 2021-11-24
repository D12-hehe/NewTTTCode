COMMAND.Name = "TradeUnban"

COMMAND.AdminMode = true
COMMAND.Flag = D3A.Config.Commands.SetGroup

COMMAND.Args = {{"string", "SteamID"}}

COMMAND.Run = function(pl, args, supp)
	local sid = D3A.ParseSteamID(tostring(args[1]))
	if (not sid) then
		D3A.Chat.SendToPlayer2(pl, moat_red, "Invalid SteamID: " .. tostring(args[1]) .. ".")
		return
	end

	D3A.MySQL.FormatQuery("DELETE FROM player_bans_trading WHERE steam_id = #;", sid, function(r)
		D3A.Chat.SendToPlayer2(pl, moat_green, "Removed " .. tostring(args[1]) .. "'s trade ban.")
		D3A.Commands.Discord("tradeunban", D3A.Commands.NameID(pl), args[1])

		local targ = player.GetBySteamID64(sid)
		if (IsValid(targ)) then
			targ.IsTradeBanned = false
			targ.TradeBanReason = nil
		end
	end)
end