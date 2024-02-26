CREATE TYPE miniterm AS OBJECT (
    T1 VARCHAR2(100),
    T2 VARCHAR2(100),
    T3 VARCHAR2(100)
);

CREATE TYPE miniterm_table AS TABLE OF miniterm;

CREATE OR REPLACE PROCEDURE generate_horizontal_miniterms (
    p_predicates IN miniterm_table
) AS
    v_miniterms miniterm_table := miniterm_table();
BEGIN
    FOR i IN 1..p_predicates.COUNT LOOP
        v_miniterms.extend;
        v_miniterms(v_miniterms.LAST) := miniterm(NULL, NULL, NULL);
        
        IF p_predicates(i).R1 IS NOT NULL THEN
            v_miniterms(v_miniterms.LAST).T1 := p_predicates(i).T1;
        END IF;
        
        IF p_predicates(i).R2 IS NOT NULL THEN
            v_miniterms(v_miniterms.LAST).T2 := p_predicates(i).T2;
        END IF;
        
        IF p_predicates(i).T3 IS NOT NULL THEN
            v_miniterms(v_miniterms.LAST).T3 := p_predicates(i).T3;
        END IF;
    END LOOP;
    
END generate_horizontal_miniterms;
