{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 2,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 591.0, 400.0, 956.0, 701.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-17",
					"items" : [ 1, ",", 2, ",", 3 ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 116.822035312652588, 166.593221187591553, 100.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"clipheight" : 33.333333333333336,
					"data" : 					{
						"clips" : [ 							{
								"absolutepath" : "crashtest.mov",
								"filename" : "crashtest.mov",
								"filekind" : "moviefile",
								"id" : "u267002497",
								"loop" : 0,
								"content_state" : 								{

								}

							}
, 							{
								"absolutepath" : "countdown.mov",
								"filename" : "countdown.mov",
								"filekind" : "moviefile",
								"id" : "u636002523",
								"loop" : 0,
								"content_state" : 								{

								}

							}
, 							{
								"absolutepath" : "dust.mp4",
								"filename" : "dust.mp4",
								"filekind" : "moviefile",
								"id" : "u650002546",
								"loop" : 0,
								"content_state" : 								{

								}

							}
 ]
					}
,
					"drawto" : "",
					"id" : "obj-13",
					"loop" : 3,
					"maxclass" : "jit.playlist",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "jit_gl_texture", "", "dictionary" ],
					"output_texture" : 1,
					"parameter_enable" : 0,
					"patching_rect" : [ 157.322035312652588, 228.542372941970825, 370.0, 103.0 ]
				}

			}
, 			{
				"box" : 				{
					"enable" : 1,
					"fps" : 30.0,
					"id" : "obj-6",
					"maxclass" : "jit.pworld",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 157.322035312652588, 365.203389406204224, 175.0, 132.075471698113233 ],
					"sync" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-17", 1 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "crashtest.mov",
				"bootpath" : "C74:/media/jitter",
				"type" : "MooV",
				"implicit" : 1
			}
, 			{
				"name" : "countdown.mov",
				"bootpath" : "C74:/media/jitter",
				"type" : "MooV",
				"implicit" : 1
			}
, 			{
				"name" : "dust.mp4",
				"bootpath" : "C74:/media/jitter",
				"type" : "mpg4",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
