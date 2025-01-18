
{{- define "go-echob21127c7-d128-4bdc-9e4f-ce11eba106ae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob21127c7-d128-4bdc-9e4f-ce11eba106ae.fullname" -}}
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


{{- define "go-echob21127c7-d128-4bdc-9e4f-ce11eba106ae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob21127c7-d128-4bdc-9e4f-ce11eba106ae.labels" -}}
helm.sh/chart: {{ include "go-echob21127c7-d128-4bdc-9e4f-ce11eba106ae.chart" . }}
{{ include "go-echob21127c7-d128-4bdc-9e4f-ce11eba106ae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob21127c7-d128-4bdc-9e4f-ce11eba106ae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob21127c7-d128-4bdc-9e4f-ce11eba106ae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}