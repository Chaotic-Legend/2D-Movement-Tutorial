[![Static Badge](https://img.shields.io/badge/Godot%20Engine-4.3-blue?style=plastic&logo=godotengine)](https://godotengine.org/) ![GitHub top language](https://img.shields.io/github/languages/top/Chaotic-Legend/2D-Movement-Tutorial?logo=godotengine)

# 2D Movement Tutorial #
[Godot Tutorial 2D - Beginner Level Platformer Controller](https://www.youtube.com/watch?v=aQazVHDztsg)

# Assets #
[Girl Knight Character Asset](https://jumpbutton.itch.io/girlknightasset) by [JumpButton](https://jumpbutton.itch.io/) ([Ko-fi](https://ko-fi.com/jump_button))

# Create a Godot task #
Step 1: Context setting
Please include the following context-setting data about the tutorial and segment you selected.

OS version: Windows 11 Pro
Application version: Godot Engine v4.6.stable.official [89cea1439]

Description of the task/project you selected
The selected task will implement basic 2D player movement in the Godot Engine using a pixelated character PNG sprite, including keyboard input handling for walking, running, height jumping, wall jumping, dashing, and a responsive camera that dynamically follows the movement logic to display the gameplay. This task will follow a YouTube video tutorial titled "Godot Tutorial 2D - Beginner Level Platformer Controller" created by IcyEngine, using the time segment from approximately 00:28 to 16:56.

- Start Point: https://youtu.be/aQazVHDztsg?si=8N-WDn4JTJ_JE8T0&t=28
- End Point: https://youtu.be/aQazVHDztsg?si=8N-WDn4JTJ_JE8T0&t=1016

In this segment, the video tutorial demonstrates how to set a pixelated character sprite from a PNG image, configure the required nodes, establish the collision and physics for the sprite asset, define input actions, write GDScript for the movement speed, including walking, running, jumping, dashing, deceleration, and acceleration, and modify the 2D environment with an obstacle. The starting state is a new Godot project with an empty 2D scene, and the ending state is a playable scene where the player character sprite can walk, run, jump, wall jump, and dash within a basic 2D game environment, and a responsive camera will smoothly track the player character to display the gameplay effectively.

Briefly describe the inputs to / input state of this project.
The input state consists of a newly created Godot Engine project, featuring a simple 2D environment developed to move a pixelated Girl Knight sprite asset from the Girl Knight Character Asset pack created by JumpButton on itch.io. In this task, I will use a single idle frame from the "Idle_KG_1.png" sprite sheet in the "Knight_player" graphics pack as the player character sprite and primary texture asset for the 2D movement system. https://jumpbutton.itch.io/girlknightasset

Step 2: Task completion
Screen recordings and intermediate artifacts.

Brief description of the breakpoint-1
Starting with the YouTube video tutorial, I created a new Godot project named "2D Movement Tutorial," opened the 2D workspace at the top, and organized it with Scenes, Scripts, and Sprites folders. I then created and saved a Main 2D scene and imported the "Idle_KG_1.png" image from the Girl Knight Character Asset pack as the first sprite asset. I then created and saved a separate Player scene, added a root "CharacterBody2D" node, attached a "CollisionShape2D" child node, opened the "Inspector," clicked on "Shape," and selected a new "RectangleShape2D" collision from the drop-down list. I attached a "Sprite2D" child node to the "Player" node and added the "Idle_KG_1.png" sprite asset to the "Sprite2D" child node by dragging the asset from the created "Sprites" folder to the empty slot next to "Texture" in the "Inspector." To use a single idle frame as the main sprite, I enabled the "Region" feature when inspecting the "Sprite2D" child node, clicked on "Edit Region," zoomed into the "Region Editor," clicked on the drop-down list next to "Snap Mode," and clicked on "Auto Slice" to choose the first idle sprite from the left side of the asset. To improve the asset's visual quality, I changed the project's default texture filter to "Nearest," centered the sprite in the 2D environment, and resized the rectangle collision shape to exactly 27.0 px by 60.5 px to match the sprite's dimensions. I then attached a GDScript to the player by clicking on the Player root node, opening the "Script" drop-down list in the "Inspector," and selecting "New Script" to write in Godot's own scripting language. I enabled the template script, set the script to "CharacterBody2D: Basic Movement", and named the script file "PlayerController.gd" to save it in the "Scripts" folder.

Brief description of the breakpoint-2
Continuing with the YouTube tutorial, I returned to the "Main" scene, opened the "Scenes" folder, and dragged the "player.tscn" file into the scene so it appeared within the default camera view. When I ran the scene, the sprite immediately fell off the screen, so I fixed this by adding a "StaticBody2D" child node of the main root node and attaching a "CollisionShape2D" to serve as a platform. In the Inspector, I set its Shape to a new "WorldBoundaryShape2D" and positioned it beneath the sprite so the player would stand on the floor when the scene runs. To ensure the player character behaved with the intended physics, I verified that the scene gravity was set to 980 px/s² by opening "Project Settings," navigating to the "Physics" section, selecting "2D," and confirming the default gravity value. I returned to the script file by clicking on "Script" at the top of the screen, where I located the default player script template and prepared to modify the GDScript by adding custom gameplay actions and input keybindings. I then clicked on "Project Settings" at the top left corner of the screen, then selected the "Input Map" tab in the new window to add new actions named "left," "right," "run," and "jump" to assign these input actions to the left and right arrow keys, the Shift key, and the Space key for player movement. To effectively control the player character using the keyboard, I need to update the script by replacing the default "ui_accept," "ui_left," and "ui_right" actions with the new "jump," "left," and "right" input actions.

Brief description of the breakpoint-3
Working with the YouTube video tutorial, I continued refining the script by replacing the constant speed value with a variable named "walk_speed" with a value of 150.0 to update the rest of the script to use this new variable for movement calculations. I want to change the "walk_speed" variable value directly from within the "Inspector," so I added an "@export" annotation in front of the "walk_speed" variable to enable a new setting in the "Inspector" to directly change the "walk_speed" value without changing the code in the script. I then added two new variables, "deceleration" and "acceleration", with a default value of 0.1, and included an "@export_range" annotation with a range of 0 to 1 to make those variables' values adjustable within the "Inspector" while staying within the defined range. I then revised the script to integrate these two new variables, allowing the player's acceleration and deceleration to be adjusted dynamically during gameplay. I added another variable named "run_speed" with a value of 250.0 and included the same "@export" annotation in front of the "run_speed" variable. I then introduced a "speed" variable that dynamically toggles between walking and running depending on whether the user is holding the run input. I integrated this "speed" variable throughout the script to interact seamlessly with the existing "acceleration" and "deceleration" variables. I created another accessible "@export" annotation variable named "jump_force" with a value of -400.0 to control the player character's jumping movement, and implemented this new variable throughout the script to replace the constant. I created and reflected another accessible annotation variable, "@export_range", named "decelerate_on_jump_release" with a range of 0 to 1 and a value of 0.5 to control a mechanic in the script where the length of time pressing the jump input determines the jump height of the player character.

Brief description of the breakpoint-4
Following the YouTube video tutorial, I implemented a wall-jumping mechanism by first adding a wall obstacle in the main scene by adding a second "StaticBody2D" child node to the Main root node, and then attaching another "CollisionShape2D" child node to that "StaticBody2D" node, and then setting the collision shape to a rectangle again. To better visualize the rectangle collision shape for the wall, I attached a white "ColorRect" child node to the second "StaticBody2D" node. And then resized it to match the collider's size and used the skill tool on the visualized rectangle collision to create a thick vertical wall. I then returned to the script to add code that enables the player character to jump from the floor or perform a wall jump against the white vertical wall in the main scene. Back in the main scene, I added a "Camera2D" child node to the "Player" node and enabled "Position Smoothing" in the "Inspector" to ensure the camera dynamically tracks the player character moving during gameplay. I also enabled the "Drag" feature for Horizontal and Vertical movement with default values, changed the "Process Callback" to "Physics," and zoomed into the scene to have a more suitable camera view. I want the character to have a new dashing action, so I navigated to the "Input Map" in the "Project Settings" and created a dash action assigned to the Ctrl key. I then returned to the script to add more accessible "@export" variables to control the dashing movement of the player character during gameplay, called "dash_speed" to set the dash speed when dashing, "dash_max_distance" to set the maximum distance when dashing, "dash_curve" to control the curve of the dash speed, and "dash_cooldown" to set the time the player character has to wait before being able to dash again. I then added variables that shouldn't appear in the "Inspector" called "is_dashing" to keep track of when the player character is dashing, "dash_start_position" to calculate if the player character reached the maximum distance, "dash_direction" to remember what direction the player character dashed into, and "dash_timer" to check that the player character can't dash while on cooldown.

Brief description of the breakpoint-5
Concluding with the YouTube video tutorial, I implemented multiple if statements that use these dashing variables to validate movement conditions, such as checking whether the player is already dashing, whether the dash cooldown timer has ended, and whether the player is allowed to dash based on their current state. These conditional checks perform real-time calculations to determine the dash direction, track the starting position of the dash, and measure the distance traveled so the dash does not exceed the defined maximum distance. The logic also responds differently when the player collides with obstacles during a dash, allowing the dash to stop early if a wall or other collider is detected. I also implemented logic to manage the dash cooldown by initializing, updating, and resetting a timer that prevents the player from dashing again until the cooldown duration has completed. Lastly, I configured the speed curve by navigating to "Dash Curve" in the "Inspector" and clicking on "New Curve" to modify the given curve line to control the speed of the dash over time, and I adjusted the curve so the dash begins at a high speed and gradually slows toward the end, creating a smooth and natural-feeling dash movement. The final result should be a functional and responsive game where the player character can walk, run, jump, wall jump, and dash within a 2D game environment.

Step 3: Task specification
Prompt reference file(s).

Reference link/description
Godot Tutorial 2D - Beginner Level Platformer Controller by IcyEngine: https://www.youtube.com/watch?v=aQazVHDztsg

Reference link/description
Girl Knight Character Asset from the Knight_player_1.4 Pack by JumpButton: https://jumpbutton.itch.io/girlknightasset

Final Prompt
In the Godot Engine, create a playable 2D scene environment with a resolution of 1152 x 648, featuring a controllable player character using a pixelated sprite asset. The project should feature a pixel-art sprite of an armored girl knight carrying a sword and shield on her back as the only character asset, rendered clearly and sharply in a 2D scene with a solid #4d4d4d background. The project should have a physics gravity value equal to exactly 980.0 pixels per second squared for the player character to respond correctly within the game environment. Using the designated sprite asset for smooth player movement, the acceleration variable determines how quickly the player speeds up when starting to walk or run, and the deceleration variable governs how gradually the player slows down when stopping. In the Input Map settings, there must be input actions named "left," "right," "run," "jump," and "dash" with corresponding arrow key bindings for horizontal movement, the Shift key binding for running, the Space key binding for jumping, and the Ctrl key binding for dashing. During gameplay, when holding down the Shift key while also pressing the left or right arrow key, the player character's movement speed should accelerate and then decelerate when the Shift key is released. The player character must support a variable-height jump mechanic in the script, where the jump input duration determines the jump height.

The player character must also support dashing when pressing the Ctrl key towards the direction the player character is moving, and only allow the player character to dash after a cooldown or if there isn't an obstacle that would stop the player character from dashing. The dash movement should be configurable via a dash curve line that starts at a high speed and gradually decreases over time, producing a smooth deceleration during the dash. The dash mechanic must include a programmable distance cap to ensure the player character travels a fixed maximum length during the execution state, preventing clipping and maintaining level constraints. To ensure the player character remains fully under the user's control, the character moves only while the player provides input. When the player presses any input action key, the character responds immediately and stops as soon as the input key is released, ensuring no autonomous movement occurs during gameplay. For body collision detection, the player character should utilize a 2D rectangular collision shape to ensure precise physics handling and 2D-controlled movement when interacting with platforms and obstacles within the game environment. To ensure accurate collision detection, the rectangular collision shape for the player character must have dimensions of exactly 27.0 px by 60.5 px to match the sprite asset size. For world boundary collision detection, an invisible platform must utilize a world boundary shape collision to create an infinite horizontal floor for the player character to stand on.

The vertical wall obstacle should use a rectangular collision shape to ensure the player character can accurately detect contact for wall physics and wall-jumping mechanics. The main scene must include a solid white vertical wall obstacle that the player character can collide with and use for wall jumping. The camera node should maintain a consistent view of the main scene and smoothly follow the player character as they move through the game environment. In the GDScript code, the player character's walking speed, running speed, and jumping mobility are adjustable variables named "walk_speed," "run_speed," "jump_force," and "decelerate_on_jump_release." In the GDScript code, the player character's dash speed, maximum dashing distance, dash curve, and dash cooldown limit are accessible and adjustable variables named "dash_speed,"  "dash_max_distance," "dash_curve," and "dash_cooldown." This project should also include programmed movement logic using the custom input actions, the jumping and movement speed variables, the dashing variables, and integrated acceleration and deceleration logic in the GDScript code. The final project delivers a functional 2D game featuring robust player movement, including collision detection and real-time behaviors such as walking, running, jumping, wall jumping, and dashing, using Godot's built-in physics and the defined Input Map actions.

Rubric Items
1.  The playable game is a 2D scene environment.

-   Open the main scene and confirm that it uses a type "Node2D" node to view the scene in the 2D editor.
-   The prompt requires that the project have a playable 2D game scene environment.

2.  The project's viewport width is 1152.

-   Confirm that the Viewport Width value is equal to 1152 by navigating
    to "Project Settings," then "Display," and then "Window."
-   The prompt requires that the project's resolution be 1152 x 648.
    Because these values are adjustable individually, they should each
    receive partial credit.

3.  The project's viewpoint height is 648.

-   Confirm that the Viewport Height value is equal to 648 by navigating
    to "Project Settings," then "Display," and then "Window."
-   The prompt requires that the project's resolution be 1152 x 648.
    Because these values are modifiable individually, they should each
    receive partial credit.

4.  The scene's background color is filled with the color #4d4d4d.

-   Verify that the Default Clear Color hex value is #4d4d4d by clicking
    on "Project Settings," then "Rendering," and then "Environment."
-   The prompt requires that the entire scene background have a color of
    #4d4d4d for the environment.

5.  The project's physics gravity value is 980 pixels/s^2.

-   Confirm that the Default Gravity value is equal to 980.0 px/s^2 by
    clicking on "Project Settings," then "Physics," and then "2D."
-   The prompt requires that the project's physics gravity be exactly
    980.0 pixels per second squared for the environment.

6.  The sprite asset renders with a clearly visible pixel-art texture.

-   Run the game scene and visually confirm that the sprite asset
    appears with a sharp and crisp resolution texture.
-   The prompt requires that the sprite asset display a clearly visible
    pixel-art texture with crisp edges and preserved detail.

7.  The sprite utilizes a pixelated Girl Knight carrying a sword and
    shield.

-   Run the game scene and visually confirm that only the pixelated Girl
    Knight sprite is visible as the player character.
-   The prompt requires that the sprite asset of an armored girl knight
    carrying a sword and shield must be the only player character.

8.  Pressing the left arrow key moves the player character to the left.

-   Run the main scene and press the left arrow key to observe the
    leftward movement direction.
-   Pressing the left arrow key should cause the sprite asset to move
    left, as required by the prompt.

9.  Pressing the right arrow key moves the player character to the
    right.

-   Run the main scene and press the right arrow key to observe the
    rightward movement direction.
-   Pressing the right arrow key should cause the sprite asset to move
    right, as required by the prompt.

10. Pressing the Shift key makes the player character move faster.

-   Run the main scene and hold down the Shift key while pressing any
    movement key to observe the sprite increase movement speed.
-   Pressing the Shift key should cause the sprite asset to run while
    pressing the left or right arrow keys, as required by the prompt.

11. Pressing the Space key makes the player character jump up.

-   Run the main scene and press the Space key to observe the sprite
    asset jump upward.
-   Pressing the Space key should cause the sprite asset to jump up, as
    required by the prompt.

12. Holding down the Space key makes the player character jump higher.

-   Run the main scene, press and hold down the Space key, and observe
    the sprite asset jumping up higher.
-   Pressing and holding down the Space key should cause the sprite
    asset to jump up higher, as required by the mechanic in the prompt.

13. Pressing the Ctrl key makes the player character quickly dash.

-   Run the main scene, press the Ctrl key while pressing a movement
    key, and observe the sprite asset instantly dash towards a
    direction.
-   Pressing the Ctrl key should cause the sprite asset to dash towards
    a direction when moving, as required by the prompt.

14. The player character stops moving when any input key is released.

-   Run the main scene, press any input action key, then release the
    action key, and observe whether movement ceases instantly.
-   The prompt requires that the player character stop moving
    immediately when any pressed input action key is released.

15. The player character uses a rectangular collision shape.

-   Open the player scene and inspect that it uses a "CollisionShape2D"
    child node with a 2D rectangle shape for body physics collision.
-   The prompt requires that the player character include appropriate
    physics and collision handling to support controlled movement.

16. The size of the collision rectangle shape is exactly 27.0 px by 60.5
    px.

-   Confirm that the "Size" value is 27.0 x 60.5 px by clicking on the
    first "CollisionShape2D" node and then "Rectangle" in the
    "Inspector."
-   The prompt requires that the size value of the collision rectangle
    shape must be 27.0 px by 60.5 px to match the size of the sprite.

17. The player character uses the uploaded sprite asset texture.

-   Open the player scene and inspect that it uses a "Sprite2D" node
    that uses the uploaded asset as the texture sprite for the game.
-   The prompt requires that the sprite asset of an armored girl knight
    carrying a sword and shield must be the only player character.

18. There is an invisible platform for the player character to move on.

-   Open the main scene and inspect that it uses a "StaticBody2D" child
    node to add a platform with collision for the sprite to stand on.
-   The prompt requires that the game environment include appropriate
    physics and collision handling to support controlled movement.

19. The invisible platform uses a world boundary collision shape.

-   Open the main scene and confirm that it uses a second
    "CollisionShape2D" node with a 2D world boundary shape.
-   The prompt requires that the game environment include appropriate
    physics and collision handling to support controlled movement.

20. There is a wall obstacle for the player character to wall jump
    against.

-   Open the main scene and confirm that it includes a second
    "StaticBody2D" node to add a wall with collision for wall jumping.
-   The prompt requires that the game environment include appropriate
    physics and collision handling to support controlled movement.

21. The wall obstacle uses a rectangular collision shape.

-   Open the main scene and confirm that it uses a third
    "CollisionShape2D" node with a rectangle shape for wall collision.
-   The prompt requires that the game environment include appropriate
    physics and collision handling to support controlled movement.

22. There is a ColorRect node to visualize the wall obstacle.

-   Open the main scene and inspect that it uses a "ColorRect" node to
    visualize a wall obstacle collision for the sprite to wall jump
    against.
-   The prompt requires that the main scene must have a vertical wall
    obstacle for the sprite asset to collide with and wall jump against.

23. The entire wall obstacle is colored solid white.

-   Confirm that the color hex value is equal to #ffffff by clicking on
    the "ColorRect" node, then clicking the "Color" box in the
    "Inspector."
-   The prompt requires that the entire vertical wall obstacle have a
    color of #ffffff to visualize the wall collision obstacle.

24. The entire wall obstacle is not colored solid white.

-   Confirm that the color value is not equal to #ffffff by clicking on
    the "ColorRect" node, then clicking the "Color" box in the
    "Inspector."
-   The prompt requires that the entire vertical wall obstacle have a
    color of exactly #ffffff to visualize the wall collision obstacle.

25. The player character is consistently displayed on-screen.

-   Open the main scene and confirm that it uses a type "Camera2D" node
    to always display the player character in the environment.
-   The prompt requires that the main scene must have a camera node to
    always display the player character while it is in motion.

26. The sprite's walking speed is adjustable by a "walk_speed" variable.

-   Inspect the GDScript code for a modifiable "walk_speed" variable
    affecting the walking movement speed of the player character.
-   The prompt requires that the GDScript code have an adjustable
    walking movement speed through a modifiable variable.

27. The sprite's running speed is adjustable by a "run_speed" variable.

-   Inspect the GDScript code for a modifiable "run_speed" variable
    affecting the running movement speed of the player character.
-   The prompt requires that the GDScript code have an adjustable
    running movement speed through a modifiable variable.

28. The sprite's movement speed increases by an "acceleration" variable.

-   Inspect the GDScript code for a modifiable "acceleration" variable
    affecting the increased movement speed of the player character.
-   The prompt requires that the GDScript code have an adjustable
    acceleration movement speed through a modifiable variable.

29. The sprite's movement speed decreases by a "deceleration" variable.

-   Inspect the GDScript code for a modifiable "deceleration" variable
    affecting the decreased movement speed of the player character.
-   The prompt requires that the GDScript code have an adjustable
    deceleration movement speed through a modifiable variable.

30. The sprite's jumping action is adjustable by a "jump_force"
    variable.

-   Inspect the GDScript code for a modifiable "jump_force" variable
    affecting the jumping movement of the player character.
-   The prompt requires that the GDScript code have an adjustable
    jumping movement value through a modifiable variable.

31. A "decelerate_on_jump_release" variable controls the jump height.

-   Inspect the GDScript code for a "decelerate_on_jump_release"
    variable that controls the jump height of the player character.
-   The prompt requires that the GDScript code include a height jump
    variable to allow the player control the sprite's jump height.

32. The sprite's dashing speed is adjustable by a "dash_speed" variable.

-   Inspect the GDScript code for a modifiable "dash_speed" variable
    affecting the dashing movement speed of the player character.
-   The prompt requires that the GDScript code have an adjustable
    dashing movement speed through a modifiable variable.

33. The maximum dash is adjustable by a "dash_max_distance" variable.

-   Inspect the GDScript code for a modifiable "dash_max_distance"
    variable affecting the maximum dash distance of the sprite asset.
-   The prompt requires that the GDScript code have an adjustable
    maximum dash distance through a modifiable variable.

34. The sprite's dashing curve is adjustable by a "dash_curve" variable.

-   Inspect the GDScript code for a modifiable "dash_curve" variable
    affecting the dashing movement curve of the player character.
-   The prompt requires that the GDScript code have an adjustable
    dashing movement curve through a modifiable variable.

35. The sprite's dashing limit is adjustable by a "dash_cooldown"
    variable.

-   Inspect the GDScript code for a modifiable "dash_cooldown" variable
    affecting the dashing cooldown of the player character.
-   The prompt requires that the GDScript code have an adjustable
    dashing cooldown limit through a modifiable variable.

36. The dash curve starts dashing fast and slows down towards the end.

-   Click on the "Dash Curve" drop-down to confirm that the curve line
    on the graph starts high and gradually decreases until a point.
-   The prompt requires the dash curve to be configurable, starting fast
    and gradually slowing down to control the dash speed behavior.

37. The Input Map includes a "left" action bound to the left arrow key.

-   Confirm an input action exists with the left arrow key by navigating
    to "Project Settings" and then to "Input Map" to see the "Action"
    list.
-   The prompt requires that the left arrow key be assigned as a
    keyboard input action to control the player character in the scene.

38. The Input Map includes a "right" action bound to the right arrow
    key.

-   Confirm an input action exists with the right arrow key by
    navigating to "Project Settings" and then to "Input Map" to see the
    "Action" list.
-   The prompt requires that the right arrow key be assigned as a
    keyboard input action to control the player character in the scene.

39. The Input Map includes a "run" action bound to the Shift key.

-   Confirm an input action exists with the Shift key by navigating to
    "Project Settings" and then to "Input Map" to see the "Action" list.
-   The prompt requires that the Shift key be assigned as a keyboard
    input action to control the player character in the scene.

40. The Input Map includes a "jump" action bound to the Space key.

-   Confirm an input action exists with the Space key by navigating to
    "Project Settings" and then to "Input Map" to see the "Action" list.
-   The prompt requires that the Space key be assigned as a keyboard
    input action to control the player character in the scene.

41. The Input Map includes a "dash" action bound to the Ctrl key.

-   Confirm an input action exists with the Ctrl key by navigating to
    "Project Settings" and then to "Input Map" to see the "Action" list.
-   The prompt requires that the Ctrl key be assigned as a keyboard
    input action to control the player character in the scene.

Godot - https://feather.openai.com/tasks/8e78a10d-9c88-46e7-b9ed-33059ea90a68 - Signed off.
