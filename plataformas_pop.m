function pop = plataformas_pop(num_plats, prob_mut, prob_cross)

pop = population('integer', [num_plats], [prob_mut], prob_cross, [2]);

endfunction