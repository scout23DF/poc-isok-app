package pt.com.joaopedro.pocs.springoauth2keycloak.business.services.impl;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Service;
import pt.com.joaopedro.pocs.springoauth2keycloak.business.models.Country;
import pt.com.joaopedro.pocs.springoauth2keycloak.business.services.ISomeBusinessService;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class SomeBusinessServiceImpl implements ISomeBusinessService {

    public List<Country> searchCountries() {
        List<Country> resultList = new ArrayList<>();
        Integer qtdFakeRecordsToGenerate = RandomUtils.nextInt(200);

        for (long i = 0; i < qtdFakeRecordsToGenerate; i++) {
            resultList.add(new Country(i, ("0" + i), "Fake Country #" + i, "Continent #" + (RandomUtils.nextInt(5))));
        }

        return resultList;
    }

}
