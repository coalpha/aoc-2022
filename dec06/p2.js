[...$`pre`.innerText.matchAll(/.(?=(.{1,14}))/g)].findIndex(m=>new Set(m[1]).size==m[1].length)+15
