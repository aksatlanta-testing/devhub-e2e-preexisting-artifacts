
{{- define "go-echofc423f14-53a9-4635-990b-0fdfa42e3907.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc423f14-53a9-4635-990b-0fdfa42e3907.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echofc423f14-53a9-4635-990b-0fdfa42e3907.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc423f14-53a9-4635-990b-0fdfa42e3907.labels" -}}
helm.sh/chart: {{ include "go-echofc423f14-53a9-4635-990b-0fdfa42e3907.chart" . }}
{{ include "go-echofc423f14-53a9-4635-990b-0fdfa42e3907.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofc423f14-53a9-4635-990b-0fdfa42e3907.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofc423f14-53a9-4635-990b-0fdfa42e3907.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}