from sys import argv
from typing import List
from i3ipc import Connection
import traceback

i3 = Connection()

i3_workspaces = i3.get_workspaces()
i3_workspaces.sort(key=lambda x: x.ipc_data["num"])
workspaces: List[int] = [e.ipc_data["num"] for e in i3_workspaces]

print(f"Workspaces {workspaces}")

current_ws = 1
for ws in i3_workspaces:
    if ws.ipc_data["focused"]:
        current_ws = ws.ipc_data["num"]


print(f"Current workspace {current_ws}")

def insert_ws(new_num: int):
    # Check if workspace num already exists
    try:
        # Renames the next workspaces to n+1 when needed
        def rename_ws(new_num: int, index: int):
            if len(workspaces) > index + 1 and workspaces[index] + 1 == workspaces[index + 1]:
                rename_ws(new_num, index + 1)

            print(f"Renaming workspace {workspaces[index]} -> {workspaces[index] + 1}")
            i3.command("rename workspace number {} to {}"
                       .format(workspaces[index], workspaces[index] + 1))

        rename_ws(new_num, workspaces.index(new_num))
    except Exception as _:
        print(f"Exception workspace {new_num}")
        traceback.print_exc()

        # Not found
        pass


match argv[1]:
    case "--insert-ws-next":
        insert_ws(current_ws + 1)
    case "--insert-ws-prev":
        insert_ws(current_ws)
    case _:
        print("Unknown command")
        exit(1)
