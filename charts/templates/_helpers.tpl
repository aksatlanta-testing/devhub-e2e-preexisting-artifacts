
{{- define "go-echofbb04f29-e93f-418e-ac94-edbb8893a6ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbb04f29-e93f-418e-ac94-edbb8893a6ac.fullname" -}}
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


{{- define "go-echofbb04f29-e93f-418e-ac94-edbb8893a6ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbb04f29-e93f-418e-ac94-edbb8893a6ac.labels" -}}
helm.sh/chart: {{ include "go-echofbb04f29-e93f-418e-ac94-edbb8893a6ac.chart" . }}
{{ include "go-echofbb04f29-e93f-418e-ac94-edbb8893a6ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofbb04f29-e93f-418e-ac94-edbb8893a6ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofbb04f29-e93f-418e-ac94-edbb8893a6ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}