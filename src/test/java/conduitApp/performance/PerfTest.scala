package conduitApp.performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

//import conduitApp.performance.createTokens.CreateTokens

class PerfTest extends Simulation {

  val protocol = karateProtocol()

//  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
//  protocol.runner.karateEnv("perf")

  val createArticle = scenario("Create and delete an article").exec(karateFeature("classpath:conduitApp/performance/createArticle.feature"))


  setUp(
    createArticle.inject(
      atOnceUsers(1)
    ).protocols(protocol)
  )

}