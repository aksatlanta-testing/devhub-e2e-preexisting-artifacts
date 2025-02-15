
{{- define "go-echoa18ddad3-3618-43c7-bbb2-edc5d723ee7b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa18ddad3-3618-43c7-bbb2-edc5d723ee7b.fullname" -}}
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


{{- define "go-echoa18ddad3-3618-43c7-bbb2-edc5d723ee7b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa18ddad3-3618-43c7-bbb2-edc5d723ee7b.labels" -}}
helm.sh/chart: {{ include "go-echoa18ddad3-3618-43c7-bbb2-edc5d723ee7b.chart" . }}
{{ include "go-echoa18ddad3-3618-43c7-bbb2-edc5d723ee7b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa18ddad3-3618-43c7-bbb2-edc5d723ee7b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa18ddad3-3618-43c7-bbb2-edc5d723ee7b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}