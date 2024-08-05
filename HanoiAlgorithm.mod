MODULE HanoiAlgorithm

    VAR num tower_height{3};
    CONST num Disk_z_offset := 10;  ! Example value, adjust as needed
    CONST num Disk_x_offset := 20;  ! Example value, adjust as needed
    CONST num Base_x := 0;          ! Example value, adjust as needed
    CONST num Base_y := 0;          ! Example value, adjust as needed
    CONST num Base_z := 0;          ! Example value, adjust as needed
    CONST num Pole_height := 100;   ! Example value, adjust as needed
    VAR num pattern{3, 3, 2};
    VAR num mv_array{100};  ! Adjust size as needed
    
local var robtarget robTEST:= [[928.6752,554.3275,-177.9826],[-0.08751068,-0.58980805,-0.16054015,0.78657181],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC movePos(var num pole1,var num pole2)
        VAR num height_1;
        VAR num height_2;
        VAR num nX1; 
        VAR num nY1;
        var num nZ1;
        VAR num z2;
        VAR num x2;
        Var num y2;
        nX1:= 0;
        nY1:=0;
        nZ1:=0;
        !test
        ! Calculate heights
        height_1 := tower_height[pole1] * Disk_z_offset;
        height_2 := tower_height[pole2] * Disk_z_offset;

        ! Calculate coordinates for the top of pole1
        nX1 := Base_x + pole1 * Disk_x_offset;
        nY1 := Base_y;  ! Assuming alignment in y
        nZ1 := Base_z + Pole_height;

        ! Move to the top of pole1
        ! this is the proper format for MOVEL
        MoveL [[nX1,nY1,nZ1],[1,0,0,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v10,fine,tool0;

        ! Calculate coordinates for the top disk on pole1
        z2 := Base_z + height_1;

        ! Move down to the top disk on pole1
        MoveL [[nX1, nY1, nZ1], [1, 0, 0, 0]];

        ! Close the gripper to pick up the disk
        CloseGripper;
        
        ! Move back up to the top of pole1 
        MoveL [[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v10,fine,tool0;

        ! Calculate coordinates for the top of pole2
        x2 := Base_x + pole2 * Disk_x_offset;
        y2 := Base_y;  ! Assuming alignment in y

        ! Move to the top of pole2
        MoveJ [[x2, y2, z1], [1, 0, 0, 0]];

        ! Calculate coordinates for the top disk on pole2
        z2 := Base_z + height_2;

        ! Move down to the top disk on pole2
        MoveL [[x2, y2, z2], [1, 0, 0, 0]];

        ! Open the gripper to release the disk
        OpenGripper;

        ! Move back up to the top of pole2
        MoveL [[x2, y2, z1], [1, 0, 0, 0]];
    ENDPROC

    PROC CloseGripper()
        ! Implement the logic to close the gripper
    ENDPROC

    PROC OpenGripper()
        ! Implement the logic to open the gripper
    ENDPROC

    FUNC num[][][] get_pattern(n_disk)
        VAR num add_val_1;
        VAR num add_val_2;
        VAR num i;

        IF n_disk < 2 THEN
            TPWrite "pattern is only useful for n_disk >= 2";
            RETURN pattern;
        ENDIF

        IF n_disk MOD 2 = 0 THEN
            add_val_1 := 1;
            add_val_2 := 2;
            FOR i FROM 0 TO 2 DO
                pattern{i, 0, 0} := -i MOD 3;
                pattern{i, 0, 1} := (-i + add_val_1) MOD 3;
                pattern{i, 1, 0} := -i MOD 3;
                pattern{i, 1, 1} := (-i + add_val_2) MOD 3;
                pattern{i, 2, 0} := (-i + add_val_1) MOD 3;
                pattern{i, 2, 1} := (-i + add_val_2) MOD 3;
            ENDFOR
        ELSE
            add_val_1 := 2;
            add_val_2 := 1;
            FOR i FROM 0 TO 2 DO
                pattern{i, 0, 0} := i;
                pattern{i, 0, 1} := (i + add_val_1) MOD 3;
                pattern{i, 1, 0} := i;
                pattern{i, 1, 1} := (i + add_val_2) MOD 3;
                pattern{i, 2, 0} := (i + add_val_1) MOD 3;
                pattern{i, 2, 1} := (i + add_val_2) MOD 3;
            ENDFOR
        ENDIF

        RETURN pattern;
    ENDFUNC

    FUNC num[] get_mv_array(n_disk)
        VAR num i;
        VAR num temp_array{100};  ! Adjust size as needed
        VAR num temp_size;
        VAR num mv_array{100};  ! Adjust size as needed
        VAR num mv_size;

        IF n_disk < 3 THEN
            TPWrite "n_disk must be at least 3";
            RETURN mv_array;
        ENDIF

        n_disk := n_disk - 2;
        mv_array{1} := 3;
        mv_size := 1;

        FOR i FROM 1 TO n_disk DO
            temp_size := mv_size;
            FOR j FROM 1 TO temp_size DO
                temp_array{j} := mv_array{j};
            ENDFOR

            mv_array{mv_size + 1} := mv_array{mv_size} + i;
            mv_size := mv_size + 1;

            FOR j FROM 1 TO temp_size DO
                mv_array{mv_size + j} := temp_array{j};
            ENDFOR

            mv_size := mv_size + temp_size;
        ENDFOR

        RETURN mv_array;
    ENDFUNC

    PROC hanoi_move(n_disk)
        VAR num n_iter;
        VAR num mv_counter;
        VAR num i;

        ! Check dimensions
        IF n_disk = 1 THEN
            ! TODO: Hard code
            RETURN;
        ELSEIF n_disk = 2 THEN
            ! TODO: Hard code
            RETURN;
        ELSE
            ! Check validity of inputs
            IF n_disk < 3 THEN
                TPWrite "n_disk must be a non-negative integer";
                RETURN;
            ENDIF
        ENDIF

        ! Reset values
        tower_height{1} := n_disk;
        tower_height{2} := 0;
        tower_height{3} := 0;

        ! Lookup tables
        ! Get a pattern for the disks
        pattern := get_pattern(n_disk);

        ! Create a list of moves from other disks
        mv_array := get_mv_array(n_disk);
        mv_array{Dim(mv_array, 1) + 1} := -1;  ! Add a dummy value at the end

        ! Solve
        n_iter := Pow(2, n_disk - 2);
        mv_counter := 0;

        FOR i FROM 1 TO n_iter DO
            ! NOTE: print values for now
            mv_counter := i MOD 3;

            ! Move the disks
            movePos(pattern{mv_counter, 1}, pattern{mv_counter, 2});
            tower_height{pattern{mv_counter, 2}} := tower_height{pattern{mv_counter, 2}} + 1;
            tower_height{pattern{mv_counter, 1}} := tower_height{pattern{mv_counter, 1}} - 1;

            movePos(pattern{mv_counter, 1}, pattern{mv_counter, 2});
            tower_height{pattern{mv_counter, 2}} := tower_height{pattern{mv_counter, 2}} + 1;
            tower_height{pattern{mv_counter, 1}} := tower_height{pattern{mv_counter, 1}} - 1;

            movePos(pattern{mv_counter, 1}, pattern{mv_counter, 2});
            tower_height{pattern{mv_counter, 2}} := tower_height{pattern{mv_counter, 2}} + 1;
            tower_height{pattern{mv_counter, 1}} := tower_height{pattern{mv_counter, 1}} - 1;

            IF mv_array{i} = -1 THEN
                EXIT;
            ENDIF

            ! Now move the extra disk
            IF mv_array{i} MOD 2 = 0 THEN
                movePos(pattern{mv_counter, 1}, pattern{mv_counter, 2});
                tower_height{pattern{mv_counter, 1}} := tower_height{pattern{mv_counter, 1}} + 1;
                tower_height{pattern{mv_counter, 2}} := tower_height{pattern{mv_counter, 2}} - 1;
            ELSE
                movePos(pattern{mv_counter, 1}, pattern{mv_counter, 2});
                tower_height{pattern{mv_counter, 2}} := tower_height{pattern{mv_counter, 2}} + 1;
                tower_height{pattern{mv_counter, 1}} := tower_height{pattern{mv_counter, 1}} - 1;
            ENDIF
        ENDFOR
    ENDPROC

ENDMODULE