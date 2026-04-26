fx_version 'cerulean'
game 'gta5'

author 'V-Scripts'
description 'V-SafeMiniGame - A safe cracking minigame for FiveM. Join https://discord.gg/vscripts to be notified for latest releases, or if you have any issues'
version '1.0.0'

escrow_ignore {
    'config.lua',
    'client/*.lua'
}

client_script {
    'config.lua',
    'client/*.lua'
}

files {
    'html/index.html',
    'html/fonts/din1451alt g.ttf',
    'html/fonts/din1451alt.ttf'
}

ui_page 'html/index.html'

lua54 'yes'