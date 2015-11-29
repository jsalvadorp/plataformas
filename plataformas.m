function plataformas(repeticiones, generaciones, prob_mut, prob_cross, pop_size)

setenv("GNUTERM", "X11");

pozos = [1,2;
2,1;
3,1;
2,2;
3,2;
3,3;
4,3;
4,4;
6,4;
4,5;
6,6;
8,6;
4,7;
8,7;
4,8;
6,8;
10,8;
6,9;
8,9;
10,9
];

plats_pozos = ...
				{[1,2,3],
				 [4,5,6],
				 [7,8,9],
				 [6,8,9],
				 [7,8,9,10,11],
				 [10,11],
				 [16,17],
				 [12,13],
				 [14,15],
				 [14,15,18],
				 [12,13,14,15],
				 [18,19,20],
				 [16,17,18,19,20],
				 [10,11,16,17],
				 [1,2,3,4,5,6,7,8,9],
				 [1,2,3,4,5],
				 [19,20],
				 [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]};

num_plats = length(plats_pozos);

c = [10, 19, 27, 34, 40, 45, 49, 52, 54, -1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 20];

plats_num_pozos = cellfun("length", plats_pozos);

a = 1;
d = 0.5;



plats_centros = cellfun(@(lista_pozos) ( mean(pozos(lista_pozos,:)) ),...
		plats_pozos,...
	 "UniformOutput", false );

costo_plat_f = @(plat) plataformas_costo_plat(pozos, plats_num_pozos, plats_pozos, plats_centros, c, a, d, plat);

plats_costos = arrayfun(costo_plat_f, (1:num_plats));

% plataformas_cost1(num_plats, plats_costos, 7)

% MAXIMIZA O MINIMIZA? invertir signo
fcnObj = @(x) -plataformas_cost1(num_plats, plats_costos, x);

%% simulacion

%p = plataformas_pop(num_plats, prob_mut, prob_cross);

%[p,B] = runGA(p,fcnObj,50);
%plot(B(:,1))

plotGA(repeticiones,generaciones,pop_size,fcnObj,'random',...
   'integer',[num_plats],[prob_mut],prob_cross,[2]);


