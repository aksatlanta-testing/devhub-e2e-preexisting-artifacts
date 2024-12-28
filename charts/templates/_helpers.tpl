
{{- define "go-echodf01fa08-dae7-49c1-bc9a-7a9029219900.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf01fa08-dae7-49c1-bc9a-7a9029219900.fullname" -}}
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


{{- define "go-echodf01fa08-dae7-49c1-bc9a-7a9029219900.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf01fa08-dae7-49c1-bc9a-7a9029219900.labels" -}}
helm.sh/chart: {{ include "go-echodf01fa08-dae7-49c1-bc9a-7a9029219900.chart" . }}
{{ include "go-echodf01fa08-dae7-49c1-bc9a-7a9029219900.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf01fa08-dae7-49c1-bc9a-7a9029219900.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf01fa08-dae7-49c1-bc9a-7a9029219900.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}