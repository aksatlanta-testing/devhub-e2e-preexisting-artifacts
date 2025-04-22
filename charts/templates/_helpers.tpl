
{{- define "go-echobae3b30f-dc2c-4cf5-8e9f-0cc8af845970.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobae3b30f-dc2c-4cf5-8e9f-0cc8af845970.fullname" -}}
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


{{- define "go-echobae3b30f-dc2c-4cf5-8e9f-0cc8af845970.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobae3b30f-dc2c-4cf5-8e9f-0cc8af845970.labels" -}}
helm.sh/chart: {{ include "go-echobae3b30f-dc2c-4cf5-8e9f-0cc8af845970.chart" . }}
{{ include "go-echobae3b30f-dc2c-4cf5-8e9f-0cc8af845970.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobae3b30f-dc2c-4cf5-8e9f-0cc8af845970.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobae3b30f-dc2c-4cf5-8e9f-0cc8af845970.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}