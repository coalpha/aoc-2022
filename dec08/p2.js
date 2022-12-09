var rows = $`pre`.innerText.trim().split`\n`.map(r => [...r]);
var max = rows.length;
var top_viewing_score = 0;
for (let y = 0; y < max; y++) {
   for (let x = 0; x < max; x++) {
      const cell = rows[y][x];

      let vis_up = 0;
      for (let my = y; my --> 0;) {
         const m_cell = rows[my][x];
         vis_up++;
         if (m_cell >= cell) {
            break;
         }
      }

      let vis_right = 0;
      for (let mx = x; max >++ mx;) {
         const m_cell = rows[y][mx];
         vis_right++;
         if (m_cell >= cell) {
            break;
         }
      }

      let vis_down = 0;
      for (let my = y; max >++ my;) {
         const m_cell = rows[my][x];
         vis_down++;
         if (m_cell >= cell) {
            break;
         }
      }

      let vis_left = 0;
      for (let mx = x; mx --> 0;) {
         const m_cell = rows[y][mx];
         vis_left++;
         if (m_cell >= cell) {
            break;
         }
      }

      const viewing_score = vis_up * vis_right * vis_down * vis_left;
      if (viewing_score > top_viewing_score) {
         top_viewing_score = viewing_score;
      }
   }
}
top_viewing_score;
