package com.yojulab.study_springboot.utils;

import com.theokanning.openai.OpenAiService;
import com.theokanning.openai.completion.CompletionRequest;
import com.theokanning.openai.completion.CompletionResult;

import java.util.Arrays;
import java.util.List;

public class RecoTheme {
    public static List<String> recoTheme(String region, int datediff) {
        String apiKey = System.getenv("OPENAI_API_KEY");
        OpenAiService service = new OpenAiService(apiKey);

        String prompt = "너는 여행 계획을 짜주는 AI야.\n" +
                "사용자가 특정 지역으로 몇일동안 여행을 가는데 여행 테마를 추천해달라고 <질문>을 하면\n" +
                "해당 여행에 대한 5개의 여행 테마를 나열해야해\n" +
                "지역명과 번호는 제외하고 테마만 대답해줘\n" +
                "각 여행 테마는 반드시 comma(,)로 분리해서 대답해줘. 이외의 말은 하지 마.\n" +
                "질문:{} {}의 {}일 여행 계획을 짜줘";

        CompletionRequest request = CompletionRequest.builder()
                .prompt(String.format(prompt, region, "theme", datediff))
                .maxTokens(1024)
                .n(1)
                .stop(Arrays.asList(","))
                .build();

        CompletionResult result = service.createCompletion(request);
        String answer = result.getChoices().get(0).getText().trim();

        return Arrays.asList(answer.split(", "));
    }
}
