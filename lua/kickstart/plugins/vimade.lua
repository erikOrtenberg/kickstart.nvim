return {
  'tadaa/vimade',
  enabled = true,
  opts = {
    ncmode = 'windows',
    fadelevel = 0.6,
    tint = {
      bg = { rgb = { 0, 0, 0 }, intensity = 0.1 },
    },
    blocklist = {
      default = {
        buf_opts = { filetype = { 'no-neck-pain' } },
      },
    },
  },
}
