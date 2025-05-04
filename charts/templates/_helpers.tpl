
{{- define "go-echoac136518-f12b-4498-a222-c29d1d861d75.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac136518-f12b-4498-a222-c29d1d861d75.fullname" -}}
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


{{- define "go-echoac136518-f12b-4498-a222-c29d1d861d75.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac136518-f12b-4498-a222-c29d1d861d75.labels" -}}
helm.sh/chart: {{ include "go-echoac136518-f12b-4498-a222-c29d1d861d75.chart" . }}
{{ include "go-echoac136518-f12b-4498-a222-c29d1d861d75.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac136518-f12b-4498-a222-c29d1d861d75.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac136518-f12b-4498-a222-c29d1d861d75.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}