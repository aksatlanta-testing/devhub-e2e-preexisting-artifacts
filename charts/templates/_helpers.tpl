
{{- define "go-echoa42d56f9-0461-4fcc-b088-7603d598beea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa42d56f9-0461-4fcc-b088-7603d598beea.fullname" -}}
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


{{- define "go-echoa42d56f9-0461-4fcc-b088-7603d598beea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa42d56f9-0461-4fcc-b088-7603d598beea.labels" -}}
helm.sh/chart: {{ include "go-echoa42d56f9-0461-4fcc-b088-7603d598beea.chart" . }}
{{ include "go-echoa42d56f9-0461-4fcc-b088-7603d598beea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa42d56f9-0461-4fcc-b088-7603d598beea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa42d56f9-0461-4fcc-b088-7603d598beea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}