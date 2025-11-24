-- tabela do cliente
create table if not exists cliente (
    id_cliente serial primary key,
    nome varchar(100) not null,
    telefone varchar(20),
    email varchar(100),
    endereco varchar(200)
);

-- tabela do produto
create table if not exists produto (
    id_produto serial primary key,
    nome varchar(100) not null,
    descricao varchar(200),
    preco numeric(10,2) not null
);

-- tabela do pedido
create table if not exists pedido (
    id_pedido serial primary key,
    id_cliente int not null,
    data_pedido date not null default current_date,
    valor_total numeric(10,2),

    constraint fk_pedido_cliente
        foreign key (id_cliente)
        references cliente(id_cliente)
        on delete cascade
);

-- tabela do item_pedido
create table if not exists item_pedido (
    id_item serial primary key,
    id_pedido int not null,
    id_produto int not null,
    quantidade int not null,
    preco_unitario numeric(10,2) not null,

    constraint fk_itempedido_pedido
        foreign key (id_pedido)
        references pedido(id_pedido)
        on delete cascade,

    constraint fk_itempedido_produto
        foreign key (id_produto)
        references produto(id_produto)
        on delete cascade
);

-- tabela do pagamento
create table if not exists pagamento (
    id_pagamento serial primary key,
    id_pedido int not null,
    data_pagamento date not null default current_date,
    valor_pago numeric(10,2) not null,
    forma_pagamento varchar(50) not null,

    constraint fk_pagamento_pedido
        foreign key (id_pedido)
        references pedido(id_pedido)
        on delete cascade
);
