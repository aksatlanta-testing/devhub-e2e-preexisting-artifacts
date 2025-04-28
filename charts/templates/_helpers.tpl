
{{- define "go-echo56c3490e-c4ae-49e5-8baf-04e501afb1ec.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo56c3490e-c4ae-49e5-8baf-04e501afb1ec.fullname" -}}
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


{{- define "go-echo56c3490e-c4ae-49e5-8baf-04e501afb1ec.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo56c3490e-c4ae-49e5-8baf-04e501afb1ec.labels" -}}
helm.sh/chart: {{ include "go-echo56c3490e-c4ae-49e5-8baf-04e501afb1ec.chart" . }}
{{ include "go-echo56c3490e-c4ae-49e5-8baf-04e501afb1ec.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo56c3490e-c4ae-49e5-8baf-04e501afb1ec.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo56c3490e-c4ae-49e5-8baf-04e501afb1ec.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}