# -*- coding: utf-8 -*-
from i3pystatus import Status
from i3pystatus.updates import dnf
from i3pystatus import get_module
from i3pystatus.weather import wunderground
from datetime import datetime

status = Status()

status.register("clock",
        format = "%Y-%m-%d %H:%M:%S KW%V")

status.register("load")

status.register(
    'battery',
    interval=5,
    format='{battery_ident}: [{status} ]{percentage_design:.2f}%',
    alert=True,
    alert_percentage=15,
    status={
        'DPL': 'DPL',
        'CHR': 'CHR',
        'DIS': 'DIS',
        'FULL': '',
    }
)

status.register("mem",
        divisor = 1073741824,
        format = "avail mem {avail_mem} GB / {total_mem} GB")

status.register("network",
        interface = "enp2s0f0",
        format_up = "{interface}: {v4}",
        format_down = "")

status.register("network",
        interface = "wlp3s0",
        format_up = "{interface}: {v4}",
        format_down = "")

status.register("now_playing",
        player = "spotify",
        format = "Spotify: {title} {status}",)

status.run()
