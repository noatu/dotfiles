hl.config({
    ecosystem = {
        no_update_news  = true,
        no_donation_nag = true,
    },

    general = {
        gaps_in  = 0,
        gaps_out = 0,
        col = {
            inactive_border = "rgb(44aaaa)",
            active_border   = "rgb(ff00ff)",
        },
        resize_on_border        = true,
        extend_border_grab_area = 5,
        hover_icon_on_border    = false,
        allow_tearing           = true,
        layout                  = "master",
    },

    master = {
        allow_small_split = true,
        mfact             = 0.5,
    },

    decoration = {
        dim_strength = 0.2, -- inert while dim_inactive is off
        dim_special  = 0,
        dim_around   = 0,
        blur = {
            size           = 3,
            ignore_opacity = false,
            noise          = 0,
            contrast       = 1.45,
            brightness     = 0.8,
        },
    },

    animations = {
        enabled = false, -- animations actually look better that way
    },

    cursor = {
        default_monitor = "DP-6",
    },

    input = {
        kb_layout  = "us,ua",
        kb_variant = "colemak,",
        -- Ctrl, AltL, Win, Space, AltGr, Ctrl; Shift+Shift for CAPS
        kb_options = "altwin:swap_lalt_lwin, grp:win_space_toggle, grp_led:caps, shift:both_capslock_cancel",

        repeat_rate  = 30,
        repeat_delay = 300,

        sensitivity   = 0.5,
        accel_profile = "flat",
        scroll_method = "2fg",

        special_fallthrough = true,

        touchpad = {
            disable_while_typing = false,
            natural_scroll       = true,
            scroll_factor        = 1.1,
            tap_button_map       = "lrm",
        },
    },

    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        force_default_wallpaper  = 1,
        background_color         = "rgb(000000)",

        mouse_move_enables_dpms = true,
        key_press_enables_dpms  = true,

        allow_session_lock_restore = true,
        render_unfocused_fps       = 10,
    },

    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles   = true, -- pressing 1331 lands on the 3rd workspace
        workspace_center_on      = 0,
    },
})

hl.device({ name = "logitech-g102-prodigy-gaming-mouse", sensitivity = 0.5 })

for _, corne in ipairs({ "corne-keyboard", "zmk-project-corne-keyboard" }) do
    hl.device({
        name                 = corne,
        kb_layout            = "us",
        kb_variant           = "",
        kb_options           = "",
        resolve_binds_by_sym = true,
    })
end
