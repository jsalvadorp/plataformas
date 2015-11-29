function costo = plataformas_costo_plat(pozos, plats_num_pozos, plats_pozos, plats_centros, c, a, d, plat)
	plats_centros{plat};
	plats_pozos{plat};
	deltas = pozos(plats_pozos{plat}, :) - plats_centros{plat};
	distancias = sqrt(sum(deltas .^ 2, 2));
	ahd = ((distancias + d) .^ 2) * a;
	costo = c(plats_num_pozos(plat)) + sum(ahd);

endfunction