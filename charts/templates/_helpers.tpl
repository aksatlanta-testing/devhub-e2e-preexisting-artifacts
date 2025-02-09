
{{- define "go-echo25304aa5-4633-42e7-ba89-5246345b13cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo25304aa5-4633-42e7-ba89-5246345b13cc.fullname" -}}
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


{{- define "go-echo25304aa5-4633-42e7-ba89-5246345b13cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo25304aa5-4633-42e7-ba89-5246345b13cc.labels" -}}
helm.sh/chart: {{ include "go-echo25304aa5-4633-42e7-ba89-5246345b13cc.chart" . }}
{{ include "go-echo25304aa5-4633-42e7-ba89-5246345b13cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo25304aa5-4633-42e7-ba89-5246345b13cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo25304aa5-4633-42e7-ba89-5246345b13cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}