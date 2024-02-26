class MinitermFragmentGenerator:
    def init(self, relations):
        self.relations = relations

    def generate_horizontal_miniterms(self, predicates):
        miniterms = []
        for predicate in predicates:
            miniterm = {}
            for relation in self.relations:
                if relation in predicate:
                    miniterm[relation] = predicate[relation]
                else:
                    miniterm[relation] = None
            miniterms.append(miniterm)
        return miniterms


relations = ['T1', 'T2', 'T3']
predicates = [
    {'T1': 'A', 'T2': 'B'},
    {'T2': 'C', 'T3': 'D'}
]

generator = MinitermFragmentGenerator(relations)
miniterms = generator.generate_horizontal_miniterms(predicates)
print(miniterms)
