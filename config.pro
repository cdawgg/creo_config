!
! NAME    config.sup
!
! DESCRIPTION
!
!	master setup file for Creo Parametric 5.0
!
! CHANGE LOG
!
!	00 - Claytin Gross created file.
!	01 - Removed "load_ui_customization_run_dir yes" due to traceback error on startup.
!
!
!
!-------------------------------------------------------------
! START OF EXECUTABLE
!-------------------------------------------------------------
!
!ENVIRONMENT SETTINGS
!
read_parameters_of_excluded yes
cleanup_drawing_dependencies yes_cs_not_required
dm_overwrite_contents_on_update yes
!
! UNIT SETTINGS
!
pro_unit_sys mmks
pro_unit_length unit_mm
pro_unit_mass unit_kilogram
tolerance_standard iso
weld_ui_standard iso
!
! DIRECTORIES
!
search_path_file $CREO_COMMON_FILES\ifx\parts\prolibrary\search.pro
trail_dir C:\Users\$USERNAME\AppData\Local\PTC\pro_objects\trail_file
! browse location
file_open_default_folder workspace
pro_format_dir wtpub://Windchill/Products/Templates
start_model_dir wtpub://Windchill/Products/Templates/
pro_spool_dir wtpub://Windchill/Libraries/Standard_Parts/Spools
! WIP do not use
!web_browser_homepage [set homepage link here - no brackets]
! remove extra tabs
enable_3dmodelspace_browser_tab no
enable_partcommunity_tab no
enable_resource_browser_tab no
! default template (no browse)
template_drawing wtpub://Windchill/Products/Templates
template_sheetmetalpart wtpub://Windchill/Products/Templates/start_shtm_prt.prt
template_solidpart wtpub://Windchill/Products/Templates/start_prt.prt
template_designasm wtpub://Windchill/Products/Templates/start_asm.asm
template_harnesspart wtpub://Windchill/Products/Templates/start_harn_prt.prt
!
!-------------------------------------------------------------
! END OF EXECUTABLE
!-------------------------------------------------------------
!
! NAME    config.pro
!
! DESCRIPTION
!
!	local setup file for Creo Parametric 5.0
!
! CHANGE LOG
!
!	00 - Claytin Gross created file.
!   01 - Added F key shortcuts.
!	02 - Built csys layers on features to allow selection from model tree.
!   03 - Added mapkey for Entry Port Designation.
!   04 - Removed dm_checkout_on_the_fly continue (checkout is default).
!		 Update issue with layers causing datum rule to not select all.
!		 NEED TO FIX entry port mapkey to designate connector.
!
!
!
!-------------------------------------------------------------
! START OF EXECUTABLE
!-------------------------------------------------------------
!
!
open_simplified_rep_by_default YES
let_proe_rename_pdm_objects yes
display_points no
datum_point_symbol dot
display_planes NO
display_coord_sys NO
display_axes NO
display_thick_cables yes
freeze_failed_cable_locations yes
!
!
!
!
!-------------------------------------------------------------
! START OF MAPKEYS
!-------------------------------------------------------------
!
! SETUP MODEL VIEWS
!
!Refit View
mapkey _008 ~ Command `ProCmdViewRefit`;
!Delete View
mapkey _009 ~ Activate `orient` `namedviewPH.NameVw_PB_Delete`;
!Save View
mapkey _010 ~ Activate `orient` `NameVw_PB_Save`;
! setup standard views based on current view as front
!-----------------------------------------------------------

mapkey _set_views @MAPKEY_NAMEsets up standard views from front;\
mapkey(continued) @MAPKEY_LABELset_views;
mapkey(continued) ~ Command `ProCmdViewOrient`;\
mapkey(continued) ~ Select `orient` `namedviewPH.NameVw_List` 1 `FRONT`;%_009;\
mapkey(continued) ~ Select `orient` `namedviewPH.NameVw_List` 1 `RIGHT`;%_009;\
mapkey(continued) ~ Select `orient` `namedviewPH.NameVw_List` 1 `BACK`;%_009;\
mapkey(continued) ~ Select `orient` `namedviewPH.NameVw_List` 1 `LEFT`;%_009;\
mapkey(continued) ~ Select `orient` `namedviewPH.NameVw_List` 1 `TOP`;%_009;\
mapkey(continued) ~ Select `orient` `namedviewPH.NameVw_List` 1 `BOTTOM`;%_009;\
mapkey(continued) ~ Select `orient` `namedviewPH.NameVw_List` 1 `ISO`;%_009;\
mapkey(continued) ~ Input `orient` `NameVw_IP` `front`;%_008;%_010;\
mapkey(continued) ~ Select `orient` `SetupOptions` 1 `dynorient`;\
mapkey(continued) ~ Activate `orient` `spinPH.YSpinBox` -90;%_008;\
mapkey(continued) ~ Input `orient` `NameVw_IP` `left`;%_010;\
mapkey(continued) ~ Activate `orient` `spinPH.YSpinBox` 180;%_008;\
mapkey(continued) ~ Input `orient` `NameVw_IP` `back`;%_010;\
mapkey(continued) ~ Activate `orient` `spinPH.YSpinBox` 90;%_008;\
mapkey(continued) ~ Input `orient` `NameVw_IP` `right`;%_010;\
mapkey(continued) ~ Activate `orient` `spinPH.YSpinBox` 0;\
mapkey(continued) ~ Activate `orient` `spinPH.XSpinBox` 90;%_008;\
mapkey(continued) ~ Input `orient` `NameVw_IP` `top`;%_010;\
mapkey(continued) ~ Activate `orient` `spinPH.YSpinBox` 0;\
mapkey(continued) ~ Activate `orient` `spinPH.XSpinBox` -180;%_008;\
mapkey(continued) ~ Input `orient` `NameVw_IP` `bottom`;%_010;\
mapkey(continued) ~ Activate `orient` `spinPH.ZSpinBox` 45.000000;\
mapkey(continued) ~ Activate `orient` `spinPH.XSpinBox` 115.264000;%_008;\
mapkey(continued) ~ Input `orient` `NameVw_IP` `iso`;%_010;~ Activate `orient` `OkPB`;
!
! SETUP MODEL LAYERS
!
!################## MAPKEYS FOR CREATING STANDARD LAYERS ###################
! shortcut mapkeys for layers
mapkey _001 ~ Activate `storage_conflicts` `OK_PushButton`;
! Open the New Layer dialog box
!------------------------------------------------------------------
mapkey _002 ~ Command `ProCmdViewLyrs` 1;~ Command `ProCmdLayer_NewLay`;
! OK button on the New Layer dialog box
!------------------------------------------------------------------
mapkey _003 ~ Activate `newlayerprops` `OkBtn`;\
mapkey(continued) ~ Activate `UI Message Dialog` `ok`;
! CANCEL button on the New Layer dialog box
!------------------------------------------------------------------
mapkey _004 ~ Activate `newlayerprops` `CancelBtn`;
!------------------------------------------------------------------
mapkey _005 ~ Select `newlayerprops` `PropTab` 1 `RulesDefsettingsLay`;\
mapkey(continued) ~ FocusOut `newlayerprops` `LayerNameInput`;\
mapkey(continued) ~ Activate `newlayerprops` `EditRulesBtn`;
mapkey _006 ~ Activate `selspecdlg0` `AddRuleBtn`;\
mapkey(continued) ~ Activate `selspecdlg0` `SelectButton`;\
mapkey(continued) ~ Activate `newlayerprops` `AssocRulesChk` 1;\
mapkey(continued) ~ Activate `newlayerprops` `OkBtn`;
! add layer rules
!------------------------------------------------------------------
mapkey _007 ~ Command `ProCmdLayer_ExtendRules`;
! extend layer rules to all of model
!------------------------------------------------------------------
!############################# CREATE LAYERS ################################
! Create all standard layer names
mapkey _name_layers %_002;%_001;\
mapkey(continued) ~ Input `newlayerprops` `LayerNameInput`  `01_datums`; %_003;%_002;\
mapkey(continued) ~ Input `newlayerprops` `LayerNameInput`  `02_csys`; %_003;%_002;\
mapkey(continued) ~ Input `newlayerprops` `LayerNameInput`  `03_axis`; %_003;%_002;\
mapkey(continued) ~ Input `newlayerprops` `LayerNameInput`  `04_points`; %_003;%_002;\
mapkey(continued) ~ Input `newlayerprops` `LayerNameInput`  `05_curves`; %_003;%_002;\
mapkey(continued) ~ Input `newlayerprops` `LayerNameInput`  `06_gtol`; %_003;%_002;\
mapkey(continued) ~ Input `newlayerprops` `LayerNameInput`  `07_cosmetics`; %_003;
! set rules for created layers
mapkey _set_rules ~ Select `main_dlg_cur` `PHTLeft.PHLayerUI.AssyTree` 7 \
mapkey(continued) `node0:01_DATUMS` `node0:02_CSYS` `node0:03_AXIS` `node0:04_POINTS` \
mapkey(continued) `node0:05_CURVES` `node0:06_GTOL` `node0:07_COSMETICS` 1;\
mapkey(continued) ~ Command `ProCmdLayer_LayProps` ; %_005;\
mapkey(continued) ~ Update `selspecdlg0` `SelOptionRadio` `Feature`;\
mapkey(continued) ~ Select `selspecdlg0` `LookByOptionMenu` 1 `Feature`;\
mapkey(continued) ~ Select `selspecdlg0` `RuleTypes` 1 `Type`;\
mapkey(continued) ~ Select `selspecdlg0` `ExtRulesLayout.ExtTyperuleLayout.TyperuleCatsList` 1 \
mapkey(continued) `Datum`;\
mapkey(continued) ~ Select `selspecdlg0` `ExtRulesLayout.ExtTyperuleLayout.TyperuleTypesList` \
mapkey(continued) 1 ` Datum#1, 923`;%_006;%_005;\
mapkey(continued) ~ Select `selspecdlg0` `ExtRulesLayout.ExtTyperuleLayout.TyperuleTypesList` \
mapkey(continued) 1 ` Coordinate System#1, 979`;%_006;%_005;\
mapkey(continued) ~ Select `selspecdlg0` `SelOptionRadio` 1 `Axis`;%_006;%_005;\
mapkey(continued) ~ Select `selspecdlg0` `SelOptionRadio` 1 `Point`;%_006;%_005;\
mapkey(continued) ~ Select `selspecdlg0` `SelOptionRadio` 1 `Curve Feature`;%_006;%_005;\
mapkey(continued) ~ Select `selspecdlg0` `SelOptionRadio` 1 `Gtol`;%_006;%_005;\
mapkey(continued) ~ Select `selspecdlg0` `SelOptionRadio` 1 `Cosmetic Feature`;%_006;%_003;
! package together
mapkey _set_layers @MAPKEY_NAMEsets up standard layers for model;\
mapkey(continued) @MAPKEY_LABELset_layers; %_name_layers;%_set_rules;%_007;
!########################### ADDITIONAL SHORTCUTS############################
!
! shortcuts assigned to F keys
mapkey $F1 ~ Command `ProCmdViewPan`;
mapkey $F2 ~ Command `ProCmdViewZoomIn`;
mapkey $F3 ~ Command `ProCmdViewZoomOut`;
mapkey $F4 ~ Command `ProCmdViewRefit`;
mapkey $F5 ~ Command `ProCmdViewRepaint`;
mapkey $F6 ~ Command `ProCmdViewPrev`;
mapkey $F7 ~ Command `ProCmdViewShade`;
mapkey $F8 ~ Command `ProCmdViewSpnPnZm`;
mapkey $F12 %_lastfeat;~ Command `ProCmdEditDelete`;
!
!shortcut to define entry ports (designate) using CS0
!-------- MAPKEY NEEDS RETURN INITIATED FOR INTERNAL LENGTH DIALOG BOX ----
!-------- MAPKEY DOES NOT ASSIGN PORT CS0 ---
!-------- MAPKEY DOES NOT ASSIGN PART PARAMETER TYPE CONNECTOR ---
mapkey _ep @MAPKEY_NAMEdesignate entry port for connector;\
mapkey(continued) @MAPKEY_LABELentry port;\
mapkey(continued)  ~ Trail `MiniToolbar` `MiniToolbar` `UIT_TRANSLUCENT` `NEED_TO_CLOSE`;\
mapkey(continued) ~ Command `ProCmdCblDesig` ;@PAUSE_FOR_SCREEN_PICK;;;#ENTRY PORTS;\
mapkey(continued) ~ Command `ProCmdMdlTreeSearch` ;\
mapkey(continued) ~ Select `selspecdlg0` `SelOptionRadio` 1 `Coord Sys`;\
mapkey(continued) ~ Update `selspecdlg0` `ExtRulesLayout.ExtBasicNameLayout.BasicNameList` \
mapkey(continued) `CS0`;\
mapkey(continued) ~ Activate `selspecdlg0` `ExtRulesLayout.ExtBasicNameLayout.BasicNameList`;\
mapkey(continued) ~ Activate `selspecdlg0` `EvaluateBtn`;~ Activate `selspecdlg0` `ApplyBtn`;\
mapkey(continued) ~ Activate `selspecdlg0` `CancelButton`;\
mapkey(continued) ~ Trail `MiniToolbar` `MiniToolbar` `UIT_TRANSLUCENT` `NEED_TO_CLOSE`;#ROUND;\
mapkey(continued) #DONE;#DONE;
!
!
!-------------------------------------------------------------
! END OF EXECUTABLE
!-------------------------------------------------------------
!
