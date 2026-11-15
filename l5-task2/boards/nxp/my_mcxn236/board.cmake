board_runner_args(jlink "--device=MCXN236" "--reset-after-load")
board_runner_args(linkserver "--device=MCXN236:FRDM-MCXN236")
board_runner_args(pyocd "--target=mcxn236")

include(${ZEPHYR_BASE}/boards/common/linkserver.board.cmake)
include(${ZEPHYR_BASE}/boards/common/jlink.board.cmake)
include(${ZEPHYR_BASE}/boards/common/pyocd.board.cmake)
