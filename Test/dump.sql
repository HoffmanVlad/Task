PGDMP     8    3                z            task    14.5    14.5     �           0    0    ENCODING    ENCODING         SET client_encoding = 'WIN866';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16805    task    DATABASE     a   CREATE DATABASE task WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE task;
                vlad    false            �            1259    16808    main    TABLE     �   CREATE TABLE public.main (
    id integer NOT NULL,
    moneys text NOT NULL,
    title text NOT NULL,
    days text NOT NULL,
    location text NOT NULL,
    beds text NOT NULL,
    description text NOT NULL
);
    DROP TABLE public.main;
       public         heap    vlad    false            �            1259    16807    main_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.main_id_seq;
       public          vlad    false    210            �           0    0    main_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.main_id_seq OWNED BY public.main.id;
          public          vlad    false    209            \           2604    16811    main id    DEFAULT     b   ALTER TABLE ONLY public.main ALTER COLUMN id SET DEFAULT nextval('public.main_id_seq'::regclass);
 6   ALTER TABLE public.main ALTER COLUMN id DROP DEFAULT;
       public          vlad    false    210    209    210            �          0    16808    main 
   TABLE DATA           T   COPY public.main (id, moneys, title, days, location, beds, description) FROM stdin;
    public          vlad    false    210   Y
       �           0    0    main_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.main_id_seq', 1, true);
          public          vlad    false    209            ^           2606    16815    main main_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.main DROP CONSTRAINT main_pkey;
       public            vlad    false    210            �   �  x��U�n�@=��x���Z�JU/`LQ0�\�l�-^u�A�uP�~|��Q��)4QG{�g޼��ykw/�k�'�!t~��Aj{�S�w���y&��a�C$�*'�����$�ں&��(��[�<XM�q:��W�,��J��x�����Ӥ���#zl���)�7t���O��/�'�k[f�o���/[�%���8ꡁbh���	'u�.���蛔ح3Ѷ-�?��CQ;�wֹ��ن�0^ᦰ�`��9�}fJ��-��.�
S�1���QB�}�r�$�0&��L#��Áv�8ќ�r��#�eU�_���|�0g{�ű2�:���3*�WvS��\�PE��G��p�h�����,ì���$�-g���)�>h��iw��e_!vT�D&����P&��ăL����M�Xt!�I�3�ְ��t0<BESL:+��2<<r�fġ��\;���[b̫[g3�AA�D�ƹţ�g�8d��Q������T     