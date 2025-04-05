
{{- define "go-echo83ca86d4-ccf4-47b9-8446-ccce457af14d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo83ca86d4-ccf4-47b9-8446-ccce457af14d.fullname" -}}
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


{{- define "go-echo83ca86d4-ccf4-47b9-8446-ccce457af14d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo83ca86d4-ccf4-47b9-8446-ccce457af14d.labels" -}}
helm.sh/chart: {{ include "go-echo83ca86d4-ccf4-47b9-8446-ccce457af14d.chart" . }}
{{ include "go-echo83ca86d4-ccf4-47b9-8446-ccce457af14d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo83ca86d4-ccf4-47b9-8446-ccce457af14d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo83ca86d4-ccf4-47b9-8446-ccce457af14d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}